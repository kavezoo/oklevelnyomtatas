<?php
declare(strict_types=1);

namespace App\Controller;

use App\Service\Diploma\IndividualDiplomaPdfService;
use App\Service\Diploma\ResultsListPdfService;
use App\Service\Diploma\TeamDiplomaPdfService;
use App\Utility\CompetitionResultsLists;
use App\Utility\TeamCompetitionRanking;
use Cake\Http\Exception\NotFoundException;
use Cake\Http\Response;
use Cake\Routing\Router;
use RuntimeException;

class DiplomasController extends AppController
{
    public function initialize(): void
    {
        parent::initialize();
        $this->loadComponent('FormProtection', [
            'unlockedActions' => [
                'generate',
                'generateTeams',
                'generateResultsIndividual',
                'generateResultsTeams',
                'generateResultsIndividualYear',
                'generateResultsTeamsYear',
                'deleteSelected',
                'delete',
            ],
        ]);
    }

    public function beforeFilter(\Cake\Event\EventInterface $event): void
    {
        parent::beforeFilter($event);

        $action = (string)$this->request->getParam('action');
        if ($action === 'index') {
            $this->FormProtection->unlockFields([
                'registration_ids',
                'team_ids',
                'has_registration_list',
                'has_team_list',
            ]);
        }
        if (in_array($action, ['files', 'deleteSelected', 'delete'], true)) {
            $this->FormProtection->unlockFields(['filenames', 'delete_all', 'filename'], true);
        }
    }

    private function unlockPdfDeleteFields(): void
    {
        $this->FormProtection->unlockFields(['filenames', 'delete_all', 'filename'], true);
    }

    public function index(): void
    {
        $competitionsTable = $this->fetchTable('Competitions');
        $competitions = $competitionsTable->find()
            ->orderByDesc('event_date')
            ->orderByDesc('id')
            ->all()
            ->combine('id', function ($row) {
                $name = (string)($row->name ?? 'Verseny');
                $date = $row->event_date?->i18nFormat('yyyy-MM-dd');

                return $date !== null ? $name . ' (' . $date . ')' : $name;
            })
            ->toArray();

        $competitionId = (int)$this->request->getQuery('competition_id');
        if ($competitionId <= 0 && $competitions !== []) {
            $competitionId = (int)array_key_first($competitions);
        }

        $competition = $competitionId > 0
            ? $competitionsTable->get($competitionId)
            : null;

        $registrations = [];
        $teamRankings = [];
        $defaultOrganizer = '';
        if ($competition !== null) {
            $defaultOrganizer = (string)($competition->organizer ?? '');
            $registrationsTable = $this->fetchTable('Registrations');
            $registrations = $registrationsTable->find()
                ->contain(['People', 'Teams'])
                ->where([
                    'Registrations.competition_id' => $competitionId,
                    'Registrations.disqualified' => false,
                    'Registrations.person_id IS NOT' => null,
                ])
                ->orderByAsc('Registrations.final_rank')
                ->orderByAsc('Registrations.registration_number')
                ->all();
            $teamRankings = TeamCompetitionRanking::forCompetition($registrationsTable, $competitionId);
        }

        $this->set(compact(
            'competitions',
            'competitionId',
            'competition',
            'registrations',
            'teamRankings',
            'defaultOrganizer',
        ));
    }

    public function results(): void
    {
        $competitionsTable = $this->fetchTable('Competitions');
        $competitions = $competitionsTable->find()
            ->orderByDesc('event_date')
            ->orderByDesc('id')
            ->all()
            ->combine('id', function ($row) {
                $name = (string)($row->name ?? 'Verseny');
                $date = $row->event_date?->i18nFormat('yyyy-MM-dd');

                return $date !== null ? $name . ' (' . $date . ')' : $name;
            })
            ->toArray();

        $competitionId = (int)$this->request->getQuery('competition_id');
        if ($competitionId <= 0 && $competitions !== []) {
            $competitionId = (int)array_key_first($competitions);
        }

        $competition = $competitionId > 0
            ? $competitionsTable->get($competitionId)
            : null;

        $resultYears = CompetitionResultsLists::yearsWithCompetitions($competitionsTable);
        $resultYear = (int)$this->request->getQuery('result_year');
        if ($resultYear <= 0 && $resultYears !== []) {
            $resultYear = (int)$resultYears[0];
        }

        $this->set(compact(
            'competitions',
            'competitionId',
            'competition',
            'resultYears',
            'resultYear',
        ));
    }

    private function pdfDomId(string $filename): string
    {
        return 'pdf-' . preg_replace('/[^a-zA-Z0-9._-]+/', '_', basename($filename));
    }

    private function flashPdfCreated(string $filename, string $summary): void
    {
        $domId = $this->pdfDomId($filename);
        $url = Router::url(['controller' => 'Diplomas', 'action' => 'files']) . '#' . $domId;
        $message = sprintf(
            '%s <a href="%s" class="alert-link fw-semibold">%s</a>',
            h($summary),
            h($url),
            h(basename($filename))
        );
        $this->Flash->success($message, ['escape' => false]);
    }

    private function redirectToPdfFile(string $filename, ?array $query = null): Response
    {
        $url = Router::url(['controller' => 'Diplomas', 'action' => 'files', '?' => $query])
            . '#' . $this->pdfDomId($filename);

        return $this->redirect($url);
    }

    public function generate(): ?Response
    {
        $this->request->allowMethod(['post']);

        $competitionId = (int)$this->request->getData('competition_id');
        $organizingClub = trim((string)$this->request->getData('organizing_club'));
        $hasList = (string)$this->request->getData('has_registration_list') === '1';
        $registrationIds = array_values(array_filter(array_map(
            'intval',
            (array)$this->request->getData('registration_ids')
        )));

        if ($competitionId <= 0) {
            $this->Flash->error('Válassz versenyt.');

            return $this->redirect(['action' => 'index']);
        }

        if ($organizingClub === '') {
            $this->Flash->error('Add meg a szervező pipaklub nevét (jobb alsó aláírás).');

            return $this->redirect(['action' => 'index', '?' => ['competition_id' => $competitionId]]);
        }

        $competition = $this->fetchTable('Competitions')->get($competitionId);

        $query = $this->fetchTable('Registrations')->find()
            ->contain(['People', 'Teams'])
            ->where([
                'Registrations.competition_id' => $competitionId,
                'Registrations.disqualified' => false,
            ]);

        if ($hasList) {
            if ($registrationIds === []) {
                $this->Flash->error('Jelölj ki legalább egy versenyzőt az oklevélhez.');

                return $this->redirect(['action' => 'index', '?' => ['competition_id' => $competitionId]]);
            }
            $query->where(['Registrations.id IN' => $registrationIds]);
        } else {
            $query->where(['Registrations.person_id IS NOT' => null]);
        }

        $registrations = $query
            ->orderByAsc('Registrations.final_rank')
            ->orderByAsc('Registrations.registration_number')
            ->all()
            ->toList();

        $filename = null;
        try {
            $service = new IndividualDiplomaPdfService();
            $binary = $service->generate($competition, $registrations, $organizingClub);
            $filename = $service->nextIndividualFilename($competition, $organizingClub);
            $service->saveToWebroot($filename, $binary);
            $this->flashPdfCreated(
                $filename,
                sprintf('Egyéni oklevél PDF elkészült (%d oldal). Kattints a fájlra a listában:', count($registrations))
            );
        } catch (RuntimeException $exception) {
            $this->Flash->error($exception->getMessage());
        }

        return $filename !== null ? $this->redirectToPdfFile($filename) : $this->redirect(['action' => 'files']);
    }

    public function generateTeams(): ?Response
    {
        $this->request->allowMethod(['post']);

        $competitionId = (int)$this->request->getData('competition_id');
        $organizingClub = trim((string)$this->request->getData('organizing_club'));
        $hasList = (string)$this->request->getData('has_team_list') === '1';
        $teamIds = array_values(array_filter(array_map('intval', (array)$this->request->getData('team_ids'))));

        if ($competitionId <= 0 || $organizingClub === '') {
            $this->Flash->error('Verseny és szervező klub kötelező.');

            return $this->redirect(['action' => 'index', '?' => ['competition_id' => $competitionId]]);
        }

        $competition = $this->fetchTable('Competitions')->get($competitionId);
        $rankings = TeamCompetitionRanking::forCompetition($this->fetchTable('Registrations'), $competitionId);

        if ($hasList) {
            if ($teamIds === []) {
                $this->Flash->error('Jelölj ki legalább egy csapatot.');

                return $this->redirect(['action' => 'index', '?' => ['competition_id' => $competitionId]]);
            }
            $rankings = array_values(array_filter(
                $rankings,
                static fn(array $row): bool => in_array($row['team_id'], $teamIds, true)
            ));
        } else {
            $rankings = array_values(array_filter(
                $rankings,
                static fn(array $row): bool => (int)$row['rank'] <= 3
            ));
        }

        $entries = array_map(static fn(array $row): array => [
            'team' => $row['team'],
            'rank' => (int)$row['rank'],
            'total_time' => $row['total_time'],
        ], $rankings);

        $filename = null;
        try {
            $service = new TeamDiplomaPdfService();
            $binary = $service->generate($competition, $entries, $organizingClub);
            $filename = $service->nextTeamFilename($competition, $organizingClub);
            $service->saveToWebroot($filename, $binary);
            $this->flashPdfCreated(
                $filename,
                sprintf('Csapatoklevél PDF elkészült (%d oldal). Kattints a fájlra a listában:', count($entries))
            );
        } catch (RuntimeException $exception) {
            $this->Flash->error($exception->getMessage());
        }

        return $filename !== null ? $this->redirectToPdfFile($filename) : $this->redirect(['action' => 'files']);
    }

    public function generateResultsIndividual(): ?Response
    {
        $this->request->allowMethod(['post']);

        $competitionId = (int)$this->request->getData('competition_id');
        if ($competitionId <= 0) {
            $this->Flash->error('Válassz versenyt.');

            return $this->redirect(['action' => 'results']);
        }

        $competition = $this->fetchTable('Competitions')->get($competitionId);
        $rows = CompetitionResultsLists::individualByTimeDesc(
            $this->fetchTable('Registrations'),
            $competitionId
        );

        $filename = null;
        try {
            $service = new ResultsListPdfService();
            $binary = $service->generateIndividualList($competition, $rows);
            $filename = $service->nextIndividualListFilename($competition);
            $service->saveToWebroot($filename, $binary);
            $this->flashPdfCreated(
                $filename,
                sprintf('Egyéni eredménylista elkészült (%d sor). Kattints a fájlra a listában:', count($rows))
            );
        } catch (RuntimeException $exception) {
            $this->Flash->error($exception->getMessage());
        }

        return $filename !== null
            ? $this->redirectToPdfFile($filename)
            : $this->redirect(['action' => 'results', '?' => ['competition_id' => $competitionId]]);
    }

    public function generateResultsTeams(): ?Response
    {
        $this->request->allowMethod(['post']);

        $competitionId = (int)$this->request->getData('competition_id');
        if ($competitionId <= 0) {
            $this->Flash->error('Válassz versenyt.');

            return $this->redirect(['action' => 'results']);
        }

        $competition = $this->fetchTable('Competitions')->get($competitionId);
        $teams = CompetitionResultsLists::teamsWithMembersDesc(
            $this->fetchTable('Registrations'),
            $competitionId
        );

        $filename = null;
        try {
            $service = new ResultsListPdfService();
            $binary = $service->generateTeamList($competition, $teams);
            $filename = $service->nextTeamListFilename($competition);
            $service->saveToWebroot($filename, $binary);
            $this->flashPdfCreated(
                $filename,
                sprintf('Csapat eredménylista elkészült (%d csapat). Kattints a fájlra a listában:', count($teams))
            );
        } catch (RuntimeException $exception) {
            $this->Flash->error($exception->getMessage());
        }

        return $filename !== null
            ? $this->redirectToPdfFile($filename)
            : $this->redirect(['action' => 'results', '?' => ['competition_id' => $competitionId]]);
    }

    public function generateResultsIndividualYear(): ?Response
    {
        $this->request->allowMethod(['post']);

        $year = (int)$this->request->getData('result_year');
        if ($year < 1900) {
            $this->Flash->error('Érvénytelen év.');

            return $this->redirect(['action' => 'results']);
        }

        $competitionsTable = $this->fetchTable('Competitions');
        $matrix = CompetitionResultsLists::individualYearMatrix(
            $this->fetchTable('Registrations'),
            $competitionsTable,
            $year
        );

        $filename = null;
        try {
            $service = new ResultsListPdfService();
            $binary = $service->generateIndividualYearMatrix($matrix);
            $filename = $service->nextIndividualYearFilename($year);
            $service->saveToWebroot($filename, $binary);
            $this->flashPdfCreated(
                $filename,
                sprintf(
                    'Éves egyéni összesítő elkészült (%d sor, %d verseny). Kattints a fájlra a listában:',
                    count($matrix['rows']),
                    count($matrix['competitions'])
                )
            );
        } catch (RuntimeException $exception) {
            $this->Flash->error($exception->getMessage());
        }

        return $filename !== null
            ? $this->redirectToPdfFile($filename)
            : $this->redirect([
                'action' => 'results',
                '?' => [
                    'competition_id' => (int)$this->request->getData('competition_id'),
                    'result_year' => $year,
                ],
            ]);
    }

    public function generateResultsTeamsYear(): ?Response
    {
        $this->request->allowMethod(['post']);

        $year = (int)$this->request->getData('result_year');
        if ($year < 1900) {
            $this->Flash->error('Érvénytelen év.');

            return $this->redirect(['action' => 'results']);
        }

        $competitionsTable = $this->fetchTable('Competitions');
        $matrix = CompetitionResultsLists::teamYearMatrix(
            $this->fetchTable('Registrations'),
            $competitionsTable,
            $year
        );

        $filename = null;
        try {
            $service = new ResultsListPdfService();
            $binary = $service->generateTeamYearMatrix($matrix);
            $filename = $service->nextTeamYearFilename($year);
            $service->saveToWebroot($filename, $binary);
            $this->flashPdfCreated(
                $filename,
                sprintf(
                    'Éves csapat összesítő elkészült (%d sor, %d verseny). Kattints a fájlra a listában:',
                    count($matrix['rows']),
                    count($matrix['competitions'])
                )
            );
        } catch (RuntimeException $exception) {
            $this->Flash->error($exception->getMessage());
        }

        return $filename !== null
            ? $this->redirectToPdfFile($filename)
            : $this->redirect([
                'action' => 'results',
                '?' => [
                    'competition_id' => (int)$this->request->getData('competition_id'),
                    'result_year' => $year,
                ],
            ]);
    }

    public function files(): void
    {
        $this->unlockPdfDeleteFields();

        $service = new IndividualDiplomaPdfService();
        $dir = $service->pdfDirectory();
        $files = [];
        if (is_dir($dir)) {
            foreach (glob($dir . '*.pdf') ?: [] as $path) {
                $files[] = [
                    'name' => basename($path),
                    'size' => filesize($path) ?: 0,
                    'modified' => filemtime($path) ?: 0,
                ];
            }
            usort($files, static fn(array $a, array $b): int => $b['modified'] <=> $a['modified']);
        }

        $this->set('files', $files);
    }

    public function download(string $filename): Response
    {
        $service = new IndividualDiplomaPdfService();
        try {
            $path = $service->resolvePdfPath($filename);
        } catch (\InvalidArgumentException) {
            throw new NotFoundException('A PDF nem található.');
        }

        return $this->response->withFile($path, [
            'download' => true,
            'name' => basename($filename),
        ]);
    }

    public function delete(?string $filename = null): Response
    {
        $this->request->allowMethod(['post']);
        $this->unlockPdfDeleteFields();

        $filename = (string)($filename ?? $this->request->getData('filename') ?? $this->request->getQuery('filename') ?? '');
        if ($filename === '') {
            $this->Flash->error('Hiányzik a fájlnév.');

            return $this->redirect(['action' => 'files']);
        }

        $service = new IndividualDiplomaPdfService();
        try {
            $service->deletePdf($filename);
            $this->Flash->success('PDF törölve: ' . basename($filename));
        } catch (\InvalidArgumentException) {
            $this->Flash->error('Érvénytelen fájl vagy nem található.');
        } catch (RuntimeException) {
            $this->Flash->error('A PDF törlése sikertelen.');
        }

        return $this->redirect(['action' => 'files']);
    }

    public function deleteSelected(): Response
    {
        $this->request->allowMethod(['post']);
        $this->unlockPdfDeleteFields();

        $deleteAll = (string)$this->request->getData('delete_all') === '1';
        if ($deleteAll) {
            $dir = (new IndividualDiplomaPdfService())->pdfDirectory();
            $filenames = [];
            if (is_dir($dir)) {
                foreach (glob($dir . '*.pdf') ?: [] as $path) {
                    $filenames[] = basename($path);
                }
            }
        } else {
            $filenames = array_values(array_filter(array_map(
                'strval',
                (array)$this->request->getData('filenames')
            )));
        }

        if ($filenames === []) {
            $this->Flash->error('Nincs törölhető PDF fájl.');

            return $this->redirect(['action' => 'files']);
        }

        $result = (new IndividualDiplomaPdfService())->deleteMany($filenames);
        if ($result['deleted'] > 0) {
            $this->Flash->success(sprintf('%d PDF fájl törölve.', $result['deleted']));
        }
        if ($result['failed'] !== []) {
            $this->Flash->warning('Nem sikerült törölni: ' . implode(', ', $result['failed']));
        }

        return $this->redirect(['action' => 'files']);
    }
}