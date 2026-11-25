<?php
declare(strict_types=1);

namespace App\Utility;

use App\Model\Entity\Team;
use App\Model\Table\RegistrationsTable;

/**
 * Csapat helyezés: a 3 leghosszabb egyéni idő összege (lassúsági verseny).
 *
 * @phpstan-type TeamRankRow array{
 *   team_id: int,
 *   team: Team,
 *   rank: int,
 *   total_seconds: int,
 *   total_time: string,
 *   member_count: int
 * }
 */
class TeamCompetitionRanking
{
    /**
     * @return list<TeamRankRow>
     */
    public static function forCompetition(RegistrationsTable $registrationsTable, int $competitionId): array
    {
        $registrations = $registrationsTable->find()
            ->contain(['Teams'])
            ->where([
                'Registrations.competition_id' => $competitionId,
                'Registrations.disqualified' => false,
                'Registrations.team_id IS NOT' => null,
            ])
            ->all();

        /** @var array<int, list<int>> $secondsByTeam */
        $secondsByTeam = [];
        /** @var array<int, Team> $teams */
        $teams = [];

        foreach ($registrations as $registration) {
            if (!RegistrationParticipation::competedInEvent($registration)) {
                continue;
            }
            $seconds = CompetitionTimeFormatter::toSeconds($registration->result_time);
            if ($seconds <= 0) {
                continue;
            }
            $teamId = (int)$registration->team_id;
            $secondsByTeam[$teamId][] = $seconds;
            if ($registration->team !== null) {
                $teams[$teamId] = $registration->team;
            }
        }

        $rows = [];
        foreach ($secondsByTeam as $teamId => $durations) {
            rsort($durations, SORT_NUMERIC);
            $topThree = array_slice($durations, 0, 3);
            $totalSeconds = array_sum($topThree);
            if ($totalSeconds <= 0 || !isset($teams[$teamId])) {
                continue;
            }
            $rows[] = [
                'team_id' => $teamId,
                'team' => $teams[$teamId],
                'rank' => 0,
                'total_seconds' => $totalSeconds,
                'total_time' => CompetitionTimeFormatter::formatSecondsForDisplay($totalSeconds),
                'member_count' => count($topThree),
            ];
        }

        usort($rows, static fn(array $a, array $b): int => $b['total_seconds'] <=> $a['total_seconds']);

        $rank = 1;
        foreach ($rows as $index => $row) {
            $rows[$index]['rank'] = $rank++;
        }

        return $rows;
    }
}