<?php
declare(strict_types=1);

use function Cake\Core\env;

return [
    'SmokeTimer' => [
        'accessDbPath' => env('SMOKE_TIMER_ACCESS_PATH', ROOT . DS . 'db' . DS . 'SmokeTimerDB.accdb'),
        'activeAccessPathFile' => env('SMOKE_TIMER_ACTIVE_PATH_FILE', ROOT . DS . 'db' . DS . 'active_access_path.txt'),
        'odbcDriver' => env('SMOKE_TIMER_ODBC_DRIVER', 'Microsoft Access Driver (*.mdb, *.accdb)'),
        'pdfOutputDir' => env('SMOKE_TIMER_PDF_DIR', WWW_ROOT . 'pdf' . DS),
        'accessBackupDir' => env('SMOKE_TIMER_ACCESS_BACKUP_DIR', ROOT . DS . 'db' . DS . 'backups' . DS),
        'accessUploadMaxBytes' => (int)env('SMOKE_TIMER_ACCESS_UPLOAD_MAX', 104857600),
    ],
];