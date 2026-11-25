<?php
declare(strict_types=1);

namespace App\Service\Access;

use App\Utility\AccessUploadLimits;
use App\Utility\ActiveAccessPath;
use Cake\Http\Exception\BadRequestException;
use Psr\Http\Message\UploadedFileInterface;
use RuntimeException;

class AccessFileUploadService
{
    public function targetPath(): string
    {
        return ActiveAccessPath::get();
    }

    public function backupDirectory(): string
    {
        $dir = (string)\Cake\Core\Configure::read('SmokeTimer.accessBackupDir');

        return rtrim($dir, '\\/') . DIRECTORY_SEPARATOR;
    }

    public function maxUploadBytes(): int
    {
        $configured = \Cake\Core\Configure::read('SmokeTimer.accessUploadMaxBytes');

        return is_int($configured) && $configured > 0 ? $configured : 100 * 1024 * 1024;
    }

    /**
     * @return array{backup: string|null, target: string, previous: string|null}
     */
    public function storeUploadedFile(UploadedFileInterface $uploadedFile, ?int $maxBytes = null): array
    {
        AccessUploadLimits::applyForAccessUpload();

        if ($uploadedFile->getError() !== UPLOAD_ERR_OK) {
            throw new BadRequestException('A feltöltés hibás (kód: ' . $uploadedFile->getError() . ').');
        }

        $clientName = $uploadedFile->getClientFilename() ?? '';
        $extension = strtolower(pathinfo($clientName, PATHINFO_EXTENSION));
        if ($extension !== 'accdb') {
            throw new BadRequestException('Csak .accdb kiterjesztésű fájl tölthető fel.');
        }

        $limit = $maxBytes ?? $this->maxUploadBytes();
        $size = $uploadedFile->getSize();
        if ($size !== null && $size > $limit) {
            throw new BadRequestException('A fájl túl nagy (max. ' . (int)($limit / 1024 / 1024) . ' MB).');
        }

        AccessReader::releaseAllLocks();

        $previousPath = ActiveAccessPath::get();
        $dbDir = dirname(ActiveAccessPath::defaultPath());
        if (!is_dir($dbDir) && !mkdir($dbDir, 0755, true) && !is_dir($dbDir)) {
            throw new RuntimeException('Nem hozható létre a db mappa: ' . $dbDir);
        }

        $backupDir = $this->backupDirectory();
        if (!is_dir($backupDir) && !mkdir($backupDir, 0755, true) && !is_dir($backupDir)) {
            throw new RuntimeException('Nem hozható létre a mentési mappa: ' . $backupDir);
        }

        $backupPath = null;
        if (is_file($previousPath)) {
            $backupPath = $backupDir . 'SmokeTimerDB_backup_' . date('Ymd_His') . '.accdb';
            if (!@copy($previousPath, $backupPath)) {
                throw new RuntimeException(
                    'A korábbi fájl mentése nem sikerült. Ha a Microsoft Access nyitva van, zárd be, majd próbáld újra.'
                );
            }
        }

        $newPath = $dbDir . DIRECTORY_SEPARATOR . 'SmokeTimerDB_' . date('Ymd_His') . '.accdb';
        $uploadedFile->moveTo($newPath);
        if (!is_file($newPath)) {
            throw new RuntimeException('A feltöltött fájl mentése sikertelen.');
        }

        ActiveAccessPath::set($newPath);

        return [
            'backup' => $backupPath,
            'target' => $newPath,
            'previous' => is_file($previousPath) ? $previousPath : null,
        ];
    }
}