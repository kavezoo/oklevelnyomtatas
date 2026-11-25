<?php
declare(strict_types=1);

namespace App\Utility;

use App\Model\Entity\Competition;
use App\Model\Table\CompetitionsTable;
use App\Model\Table\RegistrationsTable;

/**
 * Versenyeredmény-listák PDF-hez — idő szerint csökkenő (leghosszabb / legjobb előbb).
 */
class CompetitionResultsLists
{
    /**
     * @return list<array{rank: int, name: string, team_name: string, time: string, seconds: int, official_rank: int|null}>
     */
    public static function individualByTimeDesc(RegistrationsTable $table, int $competitionId): array
    {
        $registrations = $table->find()
            ->contain(['People', 'Teams'])
            ->where([
                'Registrations.competition_id' => $competitionId,
                'Registrations.disqualified' => false,
                'Registrations.person_id IS NOT' => null,
            ])
            ->all();

        $rows = [];
        foreach ($registrations as $registration) {
            if (!RegistrationParticipation::competedInEvent($registration)) {
                continue;
            }
            $seconds = CompetitionTimeFormatter::toSeconds($registration->result_time);
            if ($seconds <= 0) {
                continue;
            }
            $person = $registration->person;
            $name = '—';
            if ($person !== null) {
                $name = trim(($person->last_name ?? '') . ' ' . ($person->first_name ?? ''));
            }
            $rows[] = [
                'rank' => 0,
                'name' => $name !== '' ? $name : '—',
                'team_name' => (string)($registration->team?->name ?? '—'),
                'time' => CompetitionTimeFormatter::formatForDiploma($registration->result_time),
                'seconds' => $seconds,
                'official_rank' => $registration->final_rank !== null && (int)$registration->final_rank > 0
                    ? (int)$registration->final_rank
                    : null,
            ];
        }

        usort($rows, static fn(array $a, array $b): int => $b['seconds'] <=> $a['seconds']);

        $rank = 1;
        foreach ($rows as $index => $row) {
            $rows[$index]['rank'] = $rank++;
        }

        return $rows;
    }

    /**
     * @return list<array{
     *   rank: int,
     *   team_name: string,
     *   total_time: string,
     *   total_seconds: int,
     *   members: list<array{name: string, time: string, seconds: int, top3: bool}>
     * }>
     */
    public static function teamsWithMembersDesc(RegistrationsTable $table, int $competitionId): array
    {
        $teamRows = TeamCompetitionRanking::forCompetition($table, $competitionId);
        if ($teamRows === []) {
            return [];
        }

        $registrations = $table->find()
            ->contain(['People', 'Teams'])
            ->where([
                'Registrations.competition_id' => $competitionId,
                'Registrations.disqualified' => false,
                'Registrations.team_id IS NOT' => null,
            ])
            ->all();

        /** @var array<int, list<array{name: string, time: string, seconds: int, top3: bool}>> $membersByTeam */
        $membersByTeam = [];
        foreach ($registrations as $registration) {
            if (!RegistrationParticipation::competedInEvent($registration)) {
                continue;
            }
            $seconds = CompetitionTimeFormatter::toSeconds($registration->result_time);
            if ($seconds <= 0) {
                continue;
            }
            $teamId = (int)$registration->team_id;
            $person = $registration->person;
            $name = '—';
            if ($person !== null) {
                $name = trim(($person->last_name ?? '') . ' ' . ($person->first_name ?? ''));
            }
            $membersByTeam[$teamId][] = [
                'name' => $name !== '' ? $name : '—',
                'time' => CompetitionTimeFormatter::formatForDiploma($registration->result_time),
                'seconds' => $seconds,
                'top3' => false,
            ];
        }

        foreach ($membersByTeam as $teamId => $members) {
            usort($members, static fn(array $a, array $b): int => $b['seconds'] <=> $a['seconds']);
            foreach ($members as $i => $member) {
                $members[$i]['top3'] = $i < 3;
            }
            $membersByTeam[$teamId] = $members;
        }

        $out = [];
        foreach ($teamRows as $row) {
            $teamId = (int)$row['team_id'];
            $out[] = [
                'rank' => (int)$row['rank'],
                'team_name' => (string)($row['team']->name ?? '—'),
                'total_time' => (string)$row['total_time'],
                'total_seconds' => (int)$row['total_seconds'],
                'members' => $membersByTeam[$teamId] ?? [],
            ];
        }

        return $out;
    }

    /**
     * Éves mátrix oszlopfejléc: szervező klub, helyszín (város), dátum — külön sorokban.
     *
     * @return list<string>
     */
    public static function competitionMatrixHeaderLines(Competition $competition): array
    {
        $organizer = trim((string)($competition->organizer ?? ''));
        $place = trim((string)($competition->place ?? ''));
        $placeShort = $place;
        if (str_contains($place, ' - ')) {
            $placeShort = trim(explode(' - ', $place, 2)[0]);
        }

        $dateLine = '';
        if ($competition->event_date !== null) {
            $dateLine = $competition->event_date->i18nFormat('yyyy. MM. dd.');
        }

        $lines = [];
        if ($organizer !== '') {
            $lines[] = $organizer;
        }
        if ($placeShort !== '') {
            $lines[] = $placeShort;
        }
        if ($dateLine !== '') {
            $lines[] = $dateLine;
        }

        if ($lines === []) {
            $fallback = trim((string)($competition->name ?? ''));
            if ($fallback !== '') {
                $lines[] = $fallback;
            } else {
                $lines[] = 'Verseny';
            }
        }

        return $lines;
    }

    public static function competitionTitleLine(Competition $competition): string
    {
        $place = trim((string)($competition->place ?? ''));
        $line = $place !== '' ? $place : trim((string)($competition->name ?? 'Verseny'));
        if ($competition->event_date !== null) {
            $line .= ', ' . $competition->event_date->i18nFormat('yyyy. MMMM d.');
        }

        return $line;
    }

    /**
     * @return list<int>
     */
    public static function yearsWithCompetitions(CompetitionsTable $table): array
    {
        $years = [];
        $rows = $table->find()
            ->select(['event_date'])
            ->where(['event_date IS NOT' => null])
            ->all();
        foreach ($rows as $row) {
            if ($row->event_date !== null) {
                $years[(int)$row->event_date->format('Y')] = true;
            }
        }
        $list = array_keys($years);
        rsort($list, SORT_NUMERIC);

        return $list;
    }

    /**
     * @return list<array{id: int, label: string}>
     */
    public static function competitionsInYear(CompetitionsTable $table, int $year): array
    {
        if ($year < 1900 || $year > 2100) {
            return [];
        }

        $from = sprintf('%d-01-01', $year);
        $to = sprintf('%d-12-31', $year);

        $out = [];
        $comps = $table->find()
            ->where([
                'event_date >=' => $from,
                'event_date <=' => $to,
            ])
            ->orderByAsc('event_date')
            ->orderByAsc('id')
            ->all();

        foreach ($comps as $competition) {
            $headerLines = self::competitionMatrixHeaderLines($competition);
            $label = implode(' · ', $headerLines);
            $out[] = [
                'id' => (int)$competition->id,
                'label' => $label,
                'header_lines' => $headerLines,
            ];
        }

        return $out;
    }

    /**
     * @return array{
     *   year: int,
     *   competitions: list<array{id: int, label: string}>,
     *   rows: list<array{
     *     name: string,
     *     cells: array<int, string>,
     *     total_seconds: int,
     *     total_time: string
     *   }>
     * }
     */
    public static function individualYearMatrix(
        RegistrationsTable $registrationsTable,
        CompetitionsTable $competitionsTable,
        int $year,
    ): array {
        $competitions = self::competitionsInYear($competitionsTable, $year);
        if ($competitions === []) {
            return ['year' => $year, 'competitions' => [], 'rows' => []];
        }

        $competitionIds = array_column($competitions, 'id');
        $registrations = $registrationsTable->find()
            ->contain(['People'])
            ->where([
                'Registrations.competition_id IN' => $competitionIds,
                'Registrations.disqualified' => false,
                'Registrations.person_id IS NOT' => null,
            ])
            ->all();

        /** @var array<int, array{name: string, seconds: array<int, int>}> $byPerson */
        $byPerson = [];
        foreach ($registrations as $registration) {
            if (!RegistrationParticipation::competedInEvent($registration)) {
                continue;
            }
            $seconds = CompetitionTimeFormatter::toSeconds($registration->result_time);
            if ($seconds <= 0) {
                continue;
            }
            $personId = (int)$registration->person_id;
            $competitionId = (int)$registration->competition_id;
            $person = $registration->person;
            $name = '—';
            if ($person !== null) {
                $name = trim(($person->last_name ?? '') . ' ' . ($person->first_name ?? ''));
            }
            if ($name === '') {
                $name = '—';
            }
            if (!isset($byPerson[$personId])) {
                $byPerson[$personId] = ['name' => $name, 'seconds' => []];
            }
            $existing = $byPerson[$personId]['seconds'][$competitionId] ?? 0;
            if ($seconds > $existing) {
                $byPerson[$personId]['seconds'][$competitionId] = $seconds;
            }
        }

        $rows = [];
        foreach ($byPerson as $data) {
            $totalSeconds = array_sum($data['seconds']);
            if ($totalSeconds <= 0) {
                continue;
            }
            $cells = [];
            foreach ($competitionIds as $competitionId) {
                $sec = $data['seconds'][$competitionId] ?? 0;
                $cells[$competitionId] = $sec > 0
                    ? CompetitionTimeFormatter::formatSecondsForDisplay($sec)
                    : '';
            }
            $rows[] = [
                'name' => $data['name'],
                'cells' => $cells,
                'total_seconds' => $totalSeconds,
                'total_time' => CompetitionTimeFormatter::formatSecondsForDisplay($totalSeconds),
            ];
        }

        usort($rows, static fn(array $a, array $b): int => $b['total_seconds'] <=> $a['total_seconds']);

        return [
            'year' => $year,
            'competitions' => $competitions,
            'rows' => self::assignPlaceRanks($rows),
        ];
    }

    /**
     * @return array{
     *   year: int,
     *   competitions: list<array{id: int, label: string}>,
     *   rows: list<array{
     *     rank: int,
     *     name: string,
     *     cells: array<int, string>,
     *     total_seconds: int,
     *     total_time: string
     *   }>
     * }
     */
    public static function teamYearMatrix(
        RegistrationsTable $registrationsTable,
        CompetitionsTable $competitionsTable,
        int $year,
    ): array {
        $competitions = self::competitionsInYear($competitionsTable, $year);
        if ($competitions === []) {
            return ['year' => $year, 'competitions' => [], 'rows' => []];
        }

        $competitionIds = array_column($competitions, 'id');
        $byTeamKey = TeamYearMatrixBuilder::aggregateByClubKey($registrationsTable, $competitionIds);
        $rows = [];
        foreach ($byTeamKey as $data) {
            $totalSeconds = array_sum($data['seconds']);
            if ($totalSeconds <= 0) {
                continue;
            }
            $cells = [];
            foreach ($competitionIds as $competitionId) {
                $sec = $data['seconds'][$competitionId] ?? 0;
                $cells[$competitionId] = $sec > 0
                    ? CompetitionTimeFormatter::formatSecondsForDisplay($sec)
                    : '';
            }
            $rows[] = [
                'name' => $data['name'],
                'cells' => $cells,
                'total_seconds' => $totalSeconds,
                'total_time' => CompetitionTimeFormatter::formatSecondsForDisplay($totalSeconds),
            ];
        }

        usort($rows, static fn(array $a, array $b): int => $b['total_seconds'] <=> $a['total_seconds']);

        return [
            'year' => $year,
            'competitions' => $competitions,
            'rows' => self::assignPlaceRanks($rows),
        ];
    }

    /**
     * @param list<array<string, mixed>> $rows
     * @return list<array<string, mixed>>
     */
    private static function assignPlaceRanks(array $rows): array
    {
        $rank = 1;
        foreach ($rows as $index => $row) {
            $rows[$index]['rank'] = $rank;
            $rank++;
        }

        return $rows;
    }
}