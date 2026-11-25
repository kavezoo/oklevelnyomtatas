<?php
declare(strict_types=1);

namespace App\Controller;

use App\Service\Access\AccessFileStorageService;
use App\Service\Access\AccessFileUploadService;
use App\Service\Access\AccessImportService;
use App\Service\Access\AccessReader;
use App\Utility\AccessUploadLimits;
use App\Utility\ActiveAccessPath;
use Cake\Http\Exception\BadRequestException;
use Cake\Http\Response;
use Cake\I18n\DateTime;
use Throwable;

class ImportController extends AppController
{
    public function initialize(): void
    {
        parent::initialize();
        $this->loadComponent('FormProtection', [
            'unlockedActions' => ['deleteAccessFiles'],
        ]);
    }

    public function index(): void
    {
        $accessPath = ActiveAccessPath::get();
        $accessExists = is_file($accessPath);
        $accessModified = $accessExists ? DateTime::createFromTimestamp((int)filemtime($accessPath)) : null;

        $accessFiles = (new AccessFileStorageService())->listFiles();

        $counts = [];
        if ($accessExists) {
            $aliases = [
                'Országok' => 'Countries',
                'Klubok' => 'Clubs',
                'Személyek' => 'People',
                'Versenyek' => 'Competitions',
                'Csapatok' => 'Teams',
                'Asztalok' => 'SeatingTables',
                'Regisztrációk' => 'Registrations',
            ];
            foreach ($aliases as $label => $table) {
                $counts[$label] = $this->fetchTable($table)->find()->count();
            }
        }

        $accessUploadLimitInfo = AccessUploadLimits::uploadLimitInfo();

        $this->set(compact(
            'accessPath',
            'accessExists',
            'accessModified',
            'counts',
            'accessFiles',
            'accessUploadLimitInfo',
        ));
    }

    public function deleteAccessFile(): Response
    {
        $this->request->allowMethod(['post']);

        $storageId = (string)$this->request->getQuery('id', $this->request->getData('id', ''));

        try {
            (new AccessFileStorageService())->deleteById($storageId);
            $this->Flash->success('Access fájl törölve: ' . basename($storageId));
        } catch (\InvalidArgumentException) {
            $this->Flash->error('Érvénytelen fájl.');
        } catch (\RuntimeException $exception) {
            $this->Flash->error($exception->getMessage());
        }

        return $this->redirect(['action' => 'index']);
    }

    public function deleteAccessFiles(): Response
    {
        $this->request->allowMethod(['post']);

        $storage = new AccessFileStorageService();
        $deleteAll = (string)$this->request->getData('delete_all_access') === '1';

        if ($deleteAll) {
            $ids = array_map(static fn(array $file): string => $file['id'], array_filter(
                $storage->listFiles(),
                static fn(array $file): bool => !$file['is_active']
            ));
        } else {
            $ids = array_values(array_filter(array_map(
                'strval',
                (array)$this->request->getData('access_file_ids')
            )));
        }

        if ($ids === []) {
            $this->Flash->error('Nincs törölhető fájl (az aktív fájl nem törölhető).');

            return $this->redirect(['action' => 'index']);
        }

        $result = $storage->deleteMany($ids);
        if ($result['deleted'] > 0) {
            $this->Flash->success(sprintf('%d Access fájl törölve.', $result['deleted']));
        }
        if ($result['skipped_active']) {
            $this->Flash->warning('Az aktív fájl nem törölhető — a többi kijelölés feldolgozása megtörtént, ahol lehetett.');
        }
        if ($result['failed'] !== [] && !$result['skipped_active']) {
            $this->Flash->warning('Egyes fájlok nem törölhetők (zárolt vagy érvénytelen).');
        }

        return $this->redirect(['action' => 'index']);
    }

    public function upload(): Response
    {
        $this->request->allowMethod(['post']);

        AccessUploadLimits::applyForAccessUpload();
        AccessReader::releaseAllLocks();

        $uploadedFile = $this->request->getUploadedFile('access_file');
        if ($uploadedFile === null || $uploadedFile->getError() === UPLOAD_ERR_NO_FILE) {
            $this->Flash->error('Válassz ki egy .accdb fájlt a feltöltéshez.');

            return $this->redirect(['action' => 'index']);
        }

        if ($uploadedFile->getError() !== UPLOAD_ERR_OK) {
            $this->Flash->error(AccessUploadLimits::uploadErrorMessage($uploadedFile->getError()));

            return $this->redirect(['action' => 'index']);
        }

        try {
            $result = (new AccessFileUploadService())->storeUploadedFile(
                $uploadedFile,
                AccessUploadLimits::maxApplicationBytes()
            );
            $message = 'Feltöltés kész. Aktív fájl: ' . basename($result['target']);
            if ($result['backup'] !== null) {
                $message .= '. Mentés: ' . basename($result['backup']);
            }
            if ($result['previous'] !== null && $result['previous'] !== $result['target']) {
                $message .= '. A korábbi fájl a lemezen marad (' . basename($result['previous'])
                    . '), de már nem használt — törölheted kézzel, ha nincs zárolva.';
            }
            $message .= ' Az importálást külön gombbal indíthatod.';
            $this->Flash->success($message);
        } catch (BadRequestException $exception) {
            $this->Flash->error($exception->getMessage());
        } catch (Throwable $throwable) {
            $this->Flash->error('Feltöltés sikertelen: ' . $throwable->getMessage());
        }

        return $this->redirect(['action' => 'index']);
    }

    public function run(): ?Response
    {
        $this->request->allowMethod(['post']);

        AccessReader::releaseAllLocks();

        try {
            $stats = (new AccessImportService())->importNewRecords();
            $parts = [];
            foreach ($stats as $key => $count) {
                if ($key === 'competition_links') {
                    continue;
                }
                if ((int)$count > 0) {
                    $parts[] = sprintf('%s: %d', $key, (int)$count);
                }
            }
            if ($parts === []) {
                $this->Flash->info('Nincs új rekord az Access fájlban — minden már importálva van.');
            } else {
                $this->Flash->success('Import kész. Új rekordok: ' . implode(', ', $parts));
            }
        } catch (Throwable $throwable) {
            $this->Flash->error('Import sikertelen: ' . $throwable->getMessage());
        }

        return $this->redirect(['action' => 'index']);
    }
}