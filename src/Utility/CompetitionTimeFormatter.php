<?php
declare(strict_types=1);

namespace App\Utility;

use Cake\Chronos\ChronosTime;
use Cake\I18n\DateTime;
use DateTimeInterface;

class CompetitionTimeFormatter
{
    public static function formatDuration(mixed $value): string
    {
        if ($value === null || $value === '') {
            return '00:00:00';
        }

        if ($value instanceof ChronosTime) {
            return $value->format('H:i:s');
        }

        if ($value instanceof DateTimeInterface) {
            return $value->format('H:i:s');
        }

        $string = trim((string)$value);
        if (preg_match('/(\d{1,2}:\d{2}:\d{2})/', $string, $matches) === 1) {
            return $matches[1];
        }

        return '00:00:00';
    }

    public static function toSeconds(mixed $value): int
    {
        $formatted = self::formatDuration($value);
        if (!preg_match('/^(\d{1,2}):(\d{2}):(\d{2})$/', $formatted, $matches)) {
            return 0;
        }

        return ((int)$matches[1] * 3600) + ((int)$matches[2] * 60) + (int)$matches[3];
    }

    public static function formatSeconds(int $totalSeconds): string
    {
        if ($totalSeconds <= 0) {
            return '00:00:00';
        }

        $hours = intdiv($totalSeconds, 3600);
        $minutes = intdiv($totalSeconds % 3600, 60);
        $seconds = $totalSeconds % 60;

        return sprintf('%02d:%02d:%02d', $hours, $minutes, $seconds);
    }

    /**
     * Oklevél, PDF — rövid idő (vezető nullák nélkül):
     * - ≥ 1 óra: 1:42:23
     * - ≥ 10 perc, &lt; 1 óra: 42:23
     * - &lt; 10 perc: 3:43 (perc:másodperc, percen nem vezető nulla)
     */
    public static function formatForDiploma(mixed $value): string
    {
        return self::formatSecondsForDisplay(self::toSeconds($value));
    }

    public static function formatSecondsForDisplay(int $totalSeconds): string
    {
        if ($totalSeconds <= 0) {
            return '0:00';
        }

        $hours = intdiv($totalSeconds, 3600);
        $minutes = intdiv($totalSeconds % 3600, 60);
        $seconds = $totalSeconds % 60;

        if ($hours > 0) {
            return sprintf('%d:%02d:%02d', $hours, $minutes, $seconds);
        }

        // 10 perc alatt: 3:43; ettől felfelé óra nélkül 42:23 (perc sem kap vezető nullát)
        return sprintf('%d:%02d', $minutes, $seconds);
    }
}