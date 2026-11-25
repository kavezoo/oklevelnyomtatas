<?php
declare(strict_types=1);

namespace App\Utility;

use App\Model\Entity\Team;
use App\Model\Table\RegistrationsTable;

/**
 * Éves csapat (pipaklub) mátrix — versenyenként a klub 3 leghosszabb tagjának összege.
 * Ugyanazon klub tagjai külön csapatnéven (pl. Nitra Grey) is egy sorba kerülnek.
 */
final class TeamYearMatrixBuilder
{
    /**
     * @param list<int> $competitionIds
     * @return array<string, array{name: string, seconds: array<int, int>}>
     */
    public static function aggregateByClubKey(
        RegistrationsTable $registrationsTable,
        array $competitionIds,
    ): array {
        if ($competitionIds === []) {
            return [];
        }

        $registrations = $registrationsTable->find()
            ->contain(['Teams', 'Clubs'])
            ->where([
                'Registrations.competition_id IN' => $competitionIds,
                'Registrations.disqualified' => false,
                'Registrations.team_id IS NOT' => null,
            ])
            ->all();

        /** @var array<int, array<string, list<int>>> $secondsLists */
        $secondsLists = [];
        /** @var array<string, string> $names */
        $names = [];

        foreach ($registrations as $registration) {
            if (!RegistrationParticipation::competedInEvent($registration)) {
                continue;
            }
            $seconds = CompetitionTimeFormatter::toSeconds($registration->result_time);
            if ($seconds <= 0) {
                continue;
            }

            $competitionId = (int)$registration->competition_id;
            [$key, $displayName] = self::aggregateKeyAndName($registration->club_id, $registration->club, $registration->team);
            if ($key === null || $displayName === null) {
                continue;
            }

            $secondsLists[$competitionId][$key][] = $seconds;
            if (!isset($names[$key]) || $displayName !== '—') {
                $names[$key] = $displayName;
            }
        }

        /** @var array<string, array{name: string, seconds: array<int, int>}> $out */
        $out = [];
        foreach ($secondsLists as $competitionId => $perKey) {
            foreach ($perKey as $key => $durations) {
                rsort($durations, SORT_NUMERIC);
                $topThree = array_slice($durations, 0, 3);
                $total = array_sum($topThree);
                if ($total <= 0) {
                    continue;
                }
                if (!isset($out[$key])) {
                    $out[$key] = [
                        'name' => $names[$key] ?? '—',
                        'seconds' => [],
                    ];
                }
                $out[$key]['seconds'][$competitionId] = $total;
            }
        }

        return $out;
    }

    /**
     * @return array{0: ?string, 1: ?string}
     */
    private static function aggregateKeyAndName(
        mixed $clubId,
        ?\App\Model\Entity\Club $club,
        ?Team $team,
    ): array {
        $clubIdInt = $clubId !== null ? (int)$clubId : 0;
        if ($clubIdInt > 0) {
            $clubName = trim((string)($club?->name ?? ''));
            if ($clubName === '' && $team !== null) {
                $clubName = trim((string)($team->name ?? ''));
            }
            if ($clubName === '') {
                $clubName = '—';
            }

            return ['club:' . $clubIdInt, $clubName];
        }

        if ($team === null) {
            return [null, null];
        }

        return [
            self::teamAggregateKey($team),
            trim((string)($team->name ?? '')) !== '' ? trim((string)$team->name) : '—',
        ];
    }

    private static function teamAggregateKey(Team $team): string
    {
        $name = mb_strtolower(trim((string)($team->name ?? '')), 'UTF-8');
        if ($name !== '') {
            return 'name:' . $name;
        }

        return 'id:' . (int)$team->id;
    }
}