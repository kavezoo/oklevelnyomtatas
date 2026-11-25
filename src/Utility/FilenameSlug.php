<?php
declare(strict_types=1);

namespace App\Utility;

/**
 * Fájlnév-barát szöveg: magyar ékezet → alapbőlű, szóközök → egyetlen aláhúzás.
 */
class FilenameSlug
{
    /** @var array<string, string> */
    private const HUNGARIAN_MAP = [
        'á' => 'a',
        'é' => 'e',
        'í' => 'i',
        'ó' => 'o',
        'ö' => 'o',
        'ő' => 'o',
        'ú' => 'u',
        'ü' => 'u',
        'ű' => 'u',
        'Á' => 'a',
        'É' => 'e',
        'Í' => 'i',
        'Ó' => 'o',
        'Ö' => 'o',
        'Ő' => 'o',
        'Ú' => 'u',
        'Ü' => 'u',
        'Ű' => 'u',
    ];

    public static function fromHungarianText(string $text, string $fallback = 'nev'): string
    {
        $text = trim($text);
        if ($text === '') {
            return $fallback;
        }

        $text = mb_strtolower($text, 'UTF-8');
        $text = strtr($text, self::HUNGARIAN_MAP);
        $text = preg_replace('/[^a-z0-9]+/u', ' ', $text) ?? '';
        $text = preg_replace('/\s+/u', ' ', trim($text)) ?? '';

        if ($text === '') {
            return $fallback;
        }

        return str_replace(' ', '_', $text);
    }
}