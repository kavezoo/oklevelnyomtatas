<?php
declare(strict_types=1);

namespace App\Service\Diploma;

use App\Model\Entity\Competition;
use App\Model\Entity\Registration;
use App\Utility\CompetitionTimeFormatter;
use App\Utility\FilenameSlug;
use App\Utility\HungarianArticle;
use Cake\Core\Configure;
use Cake\I18n\I18n;
use Cake\View\View;
use Dompdf\Dompdf;
use Dompdf\Options;
use InvalidArgumentException;
use RuntimeException;

class IndividualDiplomaPdfService
{
    /**
     * @param list<Registration> $registrations
     */
    public function generate(Competition $competition, array $registrations, string $organizingClub): string
    {
        if ($registrations === []) {
            throw new RuntimeException('Nincs kiválasztva egyetlen versenyző sem.');
        }

        $pages = [];
        foreach ($registrations as $registration) {
            $pages[] = $this->buildPageData($competition, $registration, $organizingClub);
        }

        $html = $this->renderHtml($pages);

        return $this->renderPdf($html);
    }

    public function nextIndividualFilename(Competition $competition, string $organizingClub): string
    {
        $datePart = $competition->event_date?->format('Y-m-d') ?? 'nodatum';
        $organizerSlug = FilenameSlug::fromHungarianText($organizingClub, 'klub');
        $prefix = sprintf('egyeni_oklevel_%s_%s_', $datePart, $organizerSlug);

        $maxGeneration = 0;
        $dir = $this->pdfDirectory();
        foreach (glob($dir . $prefix . '*.pdf') ?: [] as $path) {
            $base = basename($path, '.pdf');
            if (preg_match('/_(\d+)$/', $base, $matches) === 1) {
                $maxGeneration = max($maxGeneration, (int)$matches[1]);
            }
        }

        return $prefix . ($maxGeneration + 1) . '.pdf';
    }

    public function saveToWebroot(string $filename, string $binary): string
    {
        $dir = $this->pdfDirectory();
        if (!is_dir($dir) && !mkdir($dir, 0755, true) && !is_dir($dir)) {
            throw new RuntimeException('Nem hozható létre a PDF mappa: ' . $dir);
        }

        $safeName = basename($filename);
        if (!preg_match('/^[a-z0-9._-]+\.pdf$/', $safeName)) {
            throw new RuntimeException('Érvénytelen PDF fájlnév: ' . $safeName);
        }

        $path = $dir . $safeName;
        if (file_put_contents($path, $binary) === false) {
            throw new RuntimeException('PDF mentése sikertelen: ' . $path);
        }

        return $path;
    }

    public function pdfDirectory(): string
    {
        $configured = Configure::read('SmokeTimer.pdfOutputDir');
        if (is_string($configured) && $configured !== '') {
            return rtrim($configured, '\\/') . DIRECTORY_SEPARATOR;
        }

        return WWW_ROOT . 'pdf' . DIRECTORY_SEPARATOR;
    }

    public function resolvePdfPath(string $filename): string
    {
        $basename = basename($filename);
        if (!preg_match('/^[a-zA-Z0-9._-]+\.pdf$/i', $basename)) {
            throw new InvalidArgumentException('Érvénytelen fájlnév.');
        }

        $path = $this->pdfDirectory() . $basename;
        $realDir = realpath($this->pdfDirectory());
        $realFile = realpath($path);
        if ($realDir === false || $realFile === false || !str_starts_with($realFile, $realDir . DIRECTORY_SEPARATOR)) {
            throw new InvalidArgumentException('A PDF nem található vagy nem törölhető.');
        }

        return $realFile;
    }

    public function deletePdf(string $filename): void
    {
        $path = $this->resolvePdfPath($filename);
        if (!unlink($path)) {
            throw new RuntimeException('A PDF törlése sikertelen.');
        }
    }

    /**
     * @param list<string> $filenames
     * @return array{deleted: int, failed: list<string>}
     */
    public function deleteMany(array $filenames): array
    {
        $deleted = 0;
        $failed = [];
        foreach ($filenames as $filename) {
            try {
                $this->deletePdf((string)$filename);
                $deleted++;
            } catch (InvalidArgumentException | RuntimeException) {
                $failed[] = basename((string)$filename);
            }
        }

        return ['deleted' => $deleted, 'failed' => $failed];
    }

    /**
     * @return array<string, mixed>
     */
    private function buildPageData(Competition $competition, Registration $registration, string $organizingClub): array
    {
        $person = $registration->person;
        $team = $registration->team;
        $teamName = $team?->name ?? '—';
        $article = HungarianArticle::definite($teamName);

        $fullName = '—';
        if ($person !== null) {
            $parts = array_filter([$person->last_name, $person->first_name]);
            $fullName = mb_strtoupper(implode(' ', $parts), 'UTF-8');
        }

        $rank = $registration->final_rank;
        $rankText = $rank !== null && (int)$rank > 0 ? (int)$rank . '.' : '—';

        I18n::setLocale('hu_HU');
        $place = trim((string)($competition->place ?? ''));
        $dateLine = $place !== '' ? $place : trim((string)($competition->name ?? ''));
        if ($competition->event_date !== null) {
            $dateLine .= ', ' . $competition->event_date->i18nFormat('yyyy. MMMM d.');
        }

        return [
            'team_article' => $article,
            'team_name' => $teamName,
            'competitor_name' => $fullName,
            'rank' => $rankText,
            'result_time' => CompetitionTimeFormatter::formatForDiploma($registration->result_time),
            'place_date' => $dateLine,
            'organizing_club' => trim($organizingClub),
        ];
    }

    /**
     * @param list<array<string, mixed>> $pages
     */
    private function renderHtml(array $pages): string
    {
        $view = new View();
        $view->setPlugin(null);
        $view->setTheme(null);
        $view->setTemplatePath('Diploma' . DIRECTORY_SEPARATOR . 'pdf');
        $view->disableAutoLayout();
        $view->set(compact('pages'));

        return $view->render('individual');
    }

    private function renderPdf(string $html): string
    {
        $options = new Options();
        $options->set('isRemoteEnabled', false);
        $options->set('defaultFont', 'DejaVu Sans');
        $options->set('isHtml5ParserEnabled', true);

        $dompdf = new Dompdf($options);
        $dompdf->loadHtml($html, 'UTF-8');
        $dompdf->setPaper('A4', 'portrait');
        $dompdf->render();

        return $dompdf->output();
    }
}