<?php
declare(strict_types=1);

namespace App\Service\Access;

use App\Utility\ActiveAccessPath;
use InvalidArgumentException;
use RuntimeException;

class AccessFileStorageService
{
    public function dbDirectory(): string
    {
        return rtrim(dirname(ActiveAccessPath::defaultPath()), '\\/') . DIRECTORY_SEPARATOR;
    }

    public function backupDirectory(): string
    {
        return (new AccessFileUploadService())->backupDirectory();
    }

    /**
     * @return list<array{
     *   id: string,
     *   name: string,
     *   location: string,
     *   size: int,
     *   modified: int,
     *   is_active: bool
     * }>
     */
    public function listFiles(): array
    {
        $active = $this->normalizeExistingPath(ActiveAccessPath::get());
        $files = [];

        foreach (glob($this->dbDirectory() . '*.accdb') ?: [] as $path) {
            $files[] = $this->buildMeta($path, 'db', $active);
        }

        $backupDir = $this->backupDirectory();
        if (is_dir($backupDir)) {
            foreach (glob($backupDir . '*.accdb') ?: [] as $path) {
                $files[] = $this->buildMeta($path, 'backups', null);
            }
        }

        usort($files, static fn(array $a, array $b): int => $b['modified'] <=> $a['modified']);

        return $files;
    }

    /**
     * @return array{id: string, name: string, location: string, size: int, modified: int, is_active: bool}
     */
    private function buildMeta(string $path, string $location, ?string $activePath): array
    {
        $name = basename($path);
        $isActive = $activePath !== null && $this->normalizeExistingPath($path) === $activePath;

        return [
            'id' => $location . '/' . $name,
            'name' => $name,
            'location' => $location === 'db' ? 'db/' : 'db/backups/',
            'size' => filesize($path) ?: 0,
            'modified' => filemtime($path) ?: 0,
            'is_active' => $isActive,
        ];
    }

    public function deleteById(string $storageId): void
    {
        $path = $this->resolvePath($storageId);
        if ($path === null) {
            throw new InvalidArgumentException('Érvénytelen fájl azonosító.');
        }

        $active = $this->normalizeExistingPath(ActiveAccessPath::get());
        if ($active !== null && $this->normalizeExistingPath($path) === $active) {
            throw new RuntimeException('Az aktív Access fájl nem törölhető. Előbb tölts fel másikat, vagy állíts be másik aktív fájlt.');
        }

        AccessReader::releaseAllLocks();

        if (!@unlink($path)) {
            throw new RuntimeException(
                'A fájl törlése sikertelen (használatban lehet). Zárd be a Microsoft Access programot.'
            );
        }
    }

    /**
     * @param list<string> $storageIds
     * @return array{deleted: int, failed: list<string>, skipped_active: bool}
     */
    public function deleteMany(array $storageIds): array
    {
        $deleted = 0;
        $failed = [];
        $skippedActive = false;

        foreach ($storageIds as $storageId) {
            try {
                $this->deleteById((string)$storageId);
                $deleted++;
            } catch (RuntimeException $exception) {
                if (str_contains($exception->getMessage(), 'aktív')) {
                    $skippedActive = true;
                }
                $failed[] = (string)$storageId;
            } catch (InvalidArgumentException) {
                $failed[] = (string)$storageId;
            }
        }

        return [
            'deleted' => $deleted,
            'failed' => $failed,
            'skipped_active' => $skippedActive,
        ];
    }

    private function resolvePath(string $storageId): ?string
    {
        if (!preg_match('/^(db|backups)\/([a-zA-Z0-9._-]+\.accdb)$/i', $storageId, $matches)) {
            return null;
        }

        $fileName = $matches[2];
        $baseDir = $matches[1] === 'db' ? $this->dbDirectory() : $this->backupDirectory();
        $path = $baseDir . $fileName;

        if (!is_file($path)) {
            return null;
        }

        $realPath = realpath($path);
        $realBase = realpath($baseDir);
        if ($realPath === false || $realBase === false) {
            return null;
        }

        if (!str_starts_with($realPath, $realBase . DIRECTORY_SEPARATOR)) {
            return null;
        }

        return $realPath;
    }

    private function normalizeExistingPath(string $path): ?string
    {
        if (!is_file($path)) {
            return null;
        }

        $real = realpath($path);

        return $real !== false ? $real : null;
    }
}