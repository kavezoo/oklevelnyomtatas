<?php
declare(strict_types=1);

namespace App\Utility;

/**
 * Magyar határozott névelő (a / az) választása a következő szó alapján.
 */
class HungarianArticle
{
    private const VOWELS = [
        'a', 'á', 'e', 'é', 'i', 'í', 'o', 'ó', 'ö', 'ő', 'u', 'ú', 'ü', 'ű',
    ];

    public static function definite(string $nextWord): string
    {
        $word = trim($nextWord);
        if ($word === '') {
            return 'a';
        }

        $first = mb_strtolower(mb_substr($word, 0, 1, 'UTF-8'), 'UTF-8');

        if (in_array($first, self::VOWELS, true)) {
            return 'az';
        }

        return 'a';
    }
}