<?php
declare(strict_types=1);

namespace App\Service\Diploma;

use App\Model\Entity\Competition;
use App\Utility\CompetitionTimeFormatter;
use App\Utility\FilenameSlug;
use App\Utility\HungarianArticle;
use Cake\Core\Configure;
use Cake\I18n\I18n;
use Cake\View\View;
use Dompdf\Dompdf;
use Dompdf\Options;
use RuntimeException;

class TeamDiplomaPdfService
{
    /**
     * @param list<array{team: \App\Model\Entity\Team, rank: int, total_time: string}> $entries
     */
    public function generate(Competition $competition, array $entries, string $organizingClub): string
    {
        if ($entries === []) {
            throw new RuntimeException('Nincs kiválasztva csapat az oklevélhez.');
        }

        $pages = [];
        foreach ($entries as $entry) {
            $pages[] = $this->buildPageData($competition, $entry, $organizingClub);
        }

        return $this->renderPdf($this->renderHtml($pages));
    }

    public function nextTeamFilename(Competition $competition, string $organizingClub): string
    {
        $datePart = $competition->event_date?->format('Y-m-d') ?? 'nodatum';
        $organizerSlug = FilenameSlug::fromHungarianText($organizingClub, 'klub');
        $prefix = sprintf('csapat_oklevel_%s_%s_', $datePart, $organizerSlug);

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

    /**
     * @param array{team: \App\Model\Entity\Team, rank: int, total_time: string} $entry
     * @return array<string, mixed>
     */
    private function buildPageData(Competition $competition, array $entry, string $organizingClub): array
    {
        $teamName = trim((string)($entry['team']->name ?? '—'));
        $article = HungarianArticle::definite($teamName);

        I18n::setLocale('hu_HU');
        $place = trim((string)($competition->place ?? ''));
        $dateLine = $place !== '' ? $place : trim((string)($competition->name ?? ''));
        if ($competition->event_date !== null) {
            $dateLine .= ', ' . $competition->event_date->i18nFormat('yyyy. MMMM d.');
        }

        return [
            'team_article' => $article,
            'team_name' => mb_strtoupper($teamName, 'UTF-8'),
            'rank' => (int)$entry['rank'] . '.',
            'total_time' => CompetitionTimeFormatter::formatForDiploma($entry['total_time']),
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

        return $view->render('team');
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