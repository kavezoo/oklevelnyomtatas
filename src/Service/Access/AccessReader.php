<?php
declare(strict_types=1);

namespace App\Service\Access;

use App\Utility\ActiveAccessPath;
use Cake\Core\Configure;
use PDO;
use PDOException;
use RuntimeException;

class AccessReader
{
    /** @var list<self> */
    private static array $instances = [];

    private ?PDO $pdo = null;

    public function __construct()
    {
        self::$instances[] = $this;
    }

    public function __destruct()
    {
        $this->close();
    }

    /**
     * ODBC kapcsolatok lezárása feltöltés / fájlcsere előtt (Windows zárolás).
     */
    public static function releaseAllLocks(): void
    {
        foreach (self::$instances as $instance) {
            $instance->close();
        }
        self::$instances = [];
        gc_collect_cycles();
    }

    public function getPdo(): PDO
    {
        if ($this->pdo !== null) {
            return $this->pdo;
        }

        $path = ActiveAccessPath::get();
        if (!is_file($path)) {
            throw new RuntimeException(sprintf('Az Access adatbázis nem található: %s', $path));
        }

        $driver = (string)Configure::read('SmokeTimer.odbcDriver');
        $dsn = sprintf('odbc:Driver={%s};Dbq=%s', $driver, $path);

        try {
            $this->pdo = new PDO($dsn);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $exception) {
            throw new RuntimeException(
                'Nem sikerült megnyitni az Access fájlt ODBC-n keresztül. ' .
                'Telepítve van a Microsoft Access Database Engine?',
                0,
                $exception
            );
        }

        return $this->pdo;
    }

    /**
     * @return list<array<string, mixed>>
     */
    public function fetchTable(string $tableName): array
    {
        $pdo = $this->pdo ?? $this->getPdo();
        $statement = $pdo->query('SELECT * FROM [' . $tableName . ']');
        $rows = $statement->fetchAll(PDO::FETCH_ASSOC) ?: [];
        $statement->closeCursor();

        return $rows;
    }

    public function close(): void
    {
        $this->pdo = null;
    }
}