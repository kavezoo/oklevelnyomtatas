<?php
declare(strict_types=1);

namespace App\Utility;

use Cake\Core\Configure;

/**
 * Aktív Access (.accdb) fájl útvonala — feltöltéskor nem kell a zárolt fájlt törölni.
 */
class ActiveAccessPath
{
    public static function markerFile(): string
    {
        $configured = Configure::read('SmokeTimer.activeAccessPathFile');
        if (is_string($configured) && $configured !== '') {
            return $configured;
        }

        return ROOT . DS . 'db' . DS . 'active_access_path.txt';
    }

    public static function defaultPath(): string
    {
        return (string)Configure::read('SmokeTimer.accessDbPath');
    }

    public static function get(): string
    {
        $marker = self::markerFile();
        if (is_file($marker)) {
            $line = trim((string)file_get_contents($marker));
            if ($line !== '') {
                $path = self::normalizePath($line);
                if (is_file($path)) {
                    return $path;
                }
            }
        }

        return self::defaultPath();
    }

    public static function set(string $absolutePath): void
    {
        $path = self::normalizePath($absolutePath);
        if (!is_file($path)) {
            throw new \RuntimeException('Az aktív Access fájl nem található: ' . $path);
        }

        $marker = self::markerFile();
        $dir = dirname($marker);
        if (!is_dir($dir) && !mkdir($dir, 0755, true) && !is_dir($dir)) {
            throw new \RuntimeException('Nem hozható létre: ' . $dir);
        }

        if (file_put_contents($marker, $path) === false) {
            throw new \RuntimeException('Nem menthető az aktív Access útvonal.');
        }
    }

    private static function normalizePath(string $path): string
    {
        $path = trim(str_replace(['/', '\\'], DIRECTORY_SEPARATOR, $path));
        if (preg_match('/^[A-Za-z]:/', $path) === 1 || str_starts_with($path, DIRECTORY_SEPARATOR)) {
            return $path;
        }

        return ROOT . DS . ltrim($path, DIRECTORY_SEPARATOR);
    }
}