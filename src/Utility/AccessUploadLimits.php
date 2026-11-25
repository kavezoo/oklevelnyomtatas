<?php
declare(strict_types=1);

namespace App\Utility;

/**
 * Nagy .accdb feltöltés — csak Import/upload környezetben (middleware + upload()).
 *
 * Az upload_max_filesize / post_max_size egy részénél a PHP már a kérés olvasásakor
 * érvényesül; az ini_set ezért nem minden SAPI-n segít — ilyenkor php.ini / vhost szükséges.
 */
final class AccessUploadLimits
{
    /** Alkalmazás-szintű felső határ (csak Access feltöltés validáció). */
    public const MAX_APPLICATION_GB = 16;

    public const MAX_APPLICATION_BYTES = self::MAX_APPLICATION_GB * 1024 * 1024 * 1024;

    public static function maxApplicationBytes(): int
    {
        return self::MAX_APPLICATION_BYTES;
    }

    /**
     * Kezelői tájékoztatás — Import feltöltés oldal.
     *
     * @return array{application_gb: int, php_upload: string, php_post: string}
     */
    public static function uploadLimitInfo(): array
    {
        return [
            'application_gb' => self::MAX_APPLICATION_GB,
            'php_upload' => (string)(ini_get('upload_max_filesize') ?: '—'),
            'php_post' => (string)(ini_get('post_max_size') ?: '—'),
        ];
    }

    public static function applyForAccessUpload(): void
    {
        @ini_set('memory_limit', '2048M');
        // 0 = korlátlan (feltöltés + mentés másolás ne álljon le időtúlás miatt).
        @ini_set('max_execution_time', '0');
        @ini_set('max_input_time', '0');
        @ini_set('upload_max_filesize', '16G');
        @ini_set('post_max_size', '16388M');

        if (function_exists('set_time_limit')) {
            @set_time_limit(0);
        }
        @ignore_user_abort(true);
    }

    public static function uploadErrorMessage(int $errorCode): string
    {
        if ($errorCode === UPLOAD_ERR_INI_SIZE || $errorCode === UPLOAD_ERR_FORM_SIZE) {
            return sprintf(
                'A fájl nagyobb, mint a PHP engedi (upload_max_filesize: %s, post_max_size: %s). '
                    . 'Ha a korlát továbbra is kicsi, állítsd a szerver php.ini-jét (nem globálisan a teljes apphoz).',
                (string)ini_get('upload_max_filesize'),
                (string)ini_get('post_max_size')
            );
        }

        return 'A feltöltés hibás (kód: ' . $errorCode . ').';
    }
}