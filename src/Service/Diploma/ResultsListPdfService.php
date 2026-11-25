<?php
declare(strict_types=1);

namespace App\Service\Diploma;

use App\Model\Entity\Competition;
use App\Utility\CompetitionResultsLists;
use App\Utility\FilenameSlug;
use Cake\View\View;
use Dompdf\Dompdf;
use Dompdf\Options;
use RuntimeException;

class ResultsListPdfService
{
    public function __construct(
        private readonly IndividualDiplomaPdfService $storage = new IndividualDiplomaPdfService(),
    ) {
    }

    /**
     * @param list<array<string, mixed>> $rows
     */
    public function generateIndividualList(Competition $competition, array $rows): string
    {
        if ($rows === []) {
            throw new RuntimeException('Nincs egyéni eredmény ehhez a versenyhez.');
        }

        $html = $this->renderHtml('individual_results_list', [
            'title' => 'Egyéni versenyeredmények',
            'competitionLine' => CompetitionResultsLists::competitionTitleLine($competition),
            'rows' => $rows,
        ]);

        return $this->renderPdf($html);
    }

    /**
     * @param list<array<string, mixed>> $teams
     */
    public function generateTeamList(Competition $competition, array $teams): string
    {
        if ($teams === []) {
            throw new RuntimeException('Nincs csapat eredmény ehhez a versenyhez.');
        }

        $html = $this->renderHtml('team_results_list', [
            'title' => 'Csapatverseny eredmények',
            'competitionLine' => CompetitionResultsLists::competitionTitleLine($competition),
            'teams' => $teams,
        ]);

        return $this->renderPdf($html);
    }

    public function nextIndividualListFilename(Competition $competition): string
    {
        return $this->nextListFilename($competition, 'egyeni_eredmenylist');
    }

    public function nextTeamListFilename(Competition $competition): string
    {
        return $this->nextListFilename($competition, 'csapat_eredmenylist');
    }

    /**
     * @param array{year: int, competitions: list<mixed>, rows: list<mixed>} $matrix
     */
    public function generateIndividualYearMatrix(array $matrix): string
    {
        if ($matrix['rows'] === [] || $matrix['competitions'] === []) {
            throw new RuntimeException('Nincs egyéni adat ehhez az évhez.');
        }

        $html = $this->renderHtml('individual_year_matrix', [
            'title' => 'Éves egyéni összesítő',
            'year' => (int)$matrix['year'],
            'competitions' => $matrix['competitions'],
            'rows' => $matrix['rows'],
        ]);

        return $this->renderPdf($html, 'landscape');
    }

    /**
     * @param array{year: int, competitions: list<mixed>, rows: list<mixed>} $matrix
     */
    public function generateTeamYearMatrix(array $matrix): string
    {
        if ($matrix['rows'] === [] || $matrix['competitions'] === []) {
            throw new RuntimeException('Nincs csapat adat ehhez az évhez.');
        }

        $html = $this->renderHtml('team_year_matrix', [
            'title' => 'Éves csapat összesítő',
            'year' => (int)$matrix['year'],
            'competitions' => $matrix['competitions'],
            'rows' => $matrix['rows'],
        ]);

        return $this->renderPdf($html, 'landscape');
    }

    public function nextIndividualYearFilename(int $year): string
    {
        return $this->nextYearFilename($year, 'egyeni_eves_osszesito');
    }

    public function nextTeamYearFilename(int $year): string
    {
        return $this->nextYearFilename($year, 'csapat_eves_osszesito');
    }

    public function saveToWebroot(string $filename, string $binary): string
    {
        return $this->storage->saveToWebroot($filename, $binary);
    }

    private function nextListFilename(Competition $competition, string $kind): string
    {
        $datePart = $competition->event_date?->format('Y-m-d') ?? 'nodatum';
        $nameSlug = FilenameSlug::fromHungarianText((string)($competition->name ?? 'verseny'), 'verseny');
        $prefix = sprintf('%s_%s_%s_', $kind, $datePart, $nameSlug);

        $maxGeneration = 0;
        $dir = $this->storage->pdfDirectory();
        foreach (glob($dir . $prefix . '*.pdf') ?: [] as $path) {
            $base = basename($path, '.pdf');
            if (preg_match('/_(\d+)$/', $base, $matches) === 1) {
                $maxGeneration = max($maxGeneration, (int)$matches[1]);
            }
        }

        return $prefix . ($maxGeneration + 1) . '.pdf';
    }

    private function nextYearFilename(int $year, string $kind): string
    {
        $prefix = sprintf('%s_%d_', $kind, $year);
        $maxGeneration = 0;
        $dir = $this->storage->pdfDirectory();
        foreach (glob($dir . $prefix . '*.pdf') ?: [] as $path) {
            $base = basename($path, '.pdf');
            if (preg_match('/_(\d+)$/', $base, $matches) === 1) {
                $maxGeneration = max($maxGeneration, (int)$matches[1]);
            }
        }

        return $prefix . ($maxGeneration + 1) . '.pdf';
    }

    /**
     * @param array<string, mixed> $vars
     */
    private function renderHtml(string $template, array $vars): string
    {
        $view = new View();
        $view->setPlugin(null);
        $view->setTheme(null);
        $view->setTemplatePath('Diploma' . DIRECTORY_SEPARATOR . 'pdf');
        $view->disableAutoLayout();
        $view->set($vars);

        return $view->render($template);
    }

    private function renderPdf(string $html, string $orientation = 'portrait'): string
    {
        $options = new Options();
        $options->set('isRemoteEnabled', false);
        $options->set('defaultFont', 'DejaVu Sans');
        $options->set('isHtml5ParserEnabled', true);

        $dompdf = new Dompdf($options);
        $dompdf->loadHtml($html, 'UTF-8');
        $dompdf->setPaper('A4', $orientation);
        $dompdf->render();

        return $dompdf->output();
    }
}