<?php
declare(strict_types=1);

namespace App\Utility;

use Cake\Datasource\QueryInterface;

/**
 * JeffAdmin fejléc kereső (?search=): szavanként AND, mezőkön OR (+ access_id és egyéb egész szám).
 */
class CrudIndexSearch
{
    /**
     * @param list<string> $likeFields Teljesen minősített mezőnevek
     * @param list<string> $intFields Ha a szó csak számjegy: pontos egyezés (access_id stb.)
     */
    public static function apply(
        QueryInterface $query,
        string $search,
        array $likeFields,
        array $intFields = [],
        ?string $distinctField = null,
    ): void {
        $search = trim($search);
        if ($search === '') {
            return;
        }

        $words = preg_split('/\s+/u', $search, -1, PREG_SPLIT_NO_EMPTY) ?: [];
        foreach ($words as $word) {
            $like = '%' . addcslashes($word, '%_\\') . '%';
            $or = [];
            foreach ($likeFields as $field) {
                $or["{$field} LIKE"] = $like;
            }
            if (preg_match('/^\d+$/', $word) === 1) {
                $int = (int)$word;
                foreach ($intFields as $field) {
                    $or[$field] = $int;
                }
            }
            if ($or === []) {
                continue;
            }
            $query->where(['OR' => $or]);
        }

        if ($distinctField !== null && $distinctField !== '') {
            $query->distinct([$distinctField]);
        }
    }
}