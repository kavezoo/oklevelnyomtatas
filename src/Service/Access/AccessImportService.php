<?php
declare(strict_types=1);

namespace App\Service\Access;

use Cake\Datasource\ConnectionManager;
use Cake\I18n\DateTime;
use Cake\ORM\Locator\LocatorAwareTrait;
use DateTimeInterface;

class AccessImportService
{
    use LocatorAwareTrait;

    /** @var array<string, array<int, int>> */
    private array $accessIdToMysqlId = [];

    public function __construct(
        private readonly AccessReader $reader = new AccessReader(),
    ) {
    }

    /**
     * @return array<string, int|bool|string>
     */
    public function importNewRecords(): array
    {
        $connection = ConnectionManager::get('default');
        $stats = [
            'countries' => 0,
            'clubs' => 0,
            'people' => 0,
            'competitions' => 0,
            'teams' => 0,
            'seating_tables' => 0,
            'registrations' => 0,
            'competition_locks' => 0,
            'smoke_timer_settings' => 0,
            'competition_links' => 0,
        ];

        try {
            $connection->transactional(function () use (&$stats): void {
                $this->accessIdToMysqlId = [];
                $this->preloadExistingMaps();
                $stats['countries'] = $this->importCountries();
                $stats['clubs'] = $this->importClubs();
                $stats['people'] = $this->importPeople();
                $stats['competitions'] = $this->importCompetitions();
                $stats['competition_links'] = $this->linkCompetitionReferences();
                $stats['teams'] = $this->importTeams();
                $stats['seating_tables'] = $this->importSeatingTables();
                $stats['registrations'] = $this->importRegistrations();
                $stats['competition_locks'] = $this->importCompetitionLocks();
                $stats['smoke_timer_settings'] = $this->importSettings();
            });
        } finally {
            AccessReader::releaseAllLocks();
        }

        return $stats;
    }

    private function preloadExistingMaps(): void
    {
        $aliases = [
            'Countries',
            'Clubs',
            'People',
            'Competitions',
            'Teams',
            'SeatingTables',
            'Registrations',
            'CompetitionLocks',
            'SmokeTimerSettings',
        ];
        foreach ($aliases as $alias) {
            $table = $this->fetchTable($alias);
            $rows = $table->find()
                ->select(['id', 'access_id'])
                ->enableHydration(false)
                ->all();
            foreach ($rows as $row) {
                $this->rememberAccessId($alias, (int)$row['access_id'], (int)$row['id']);
            }
        }
    }

    private function importCountries(): int
    {
        $table = $this->fetchTable('Countries');
        $inserted = 0;
        foreach ($this->reader->fetchTable('tblStaty') as $row) {
            $accessId = $this->intVal($row['ID'] ?? null);
            if ($accessId === null || $this->existsAccessId($table, $accessId)) {
                continue;
            }
            $entity = $table->newEntity([
                'access_id' => $accessId,
                'code' => $this->stringVal($row['Skratka'] ?? null),
                'short_name_en' => $this->stringVal($row['SkratenyNazovEN'] ?? null),
            ]);
            if ($table->save($entity)) {
                $this->rememberAccessId('Countries', $accessId, (int)$entity->id);
                $inserted++;
            }
        }

        return $inserted;
    }

    private function importClubs(): int
    {
        $table = $this->fetchTable('Clubs');
        $inserted = 0;
        foreach ($this->reader->fetchTable('tblKluby') as $row) {
            $accessId = $this->intVal($row['ID'] ?? null);
            if ($accessId === null || $this->existsAccessId($table, $accessId)) {
                continue;
            }
            $entity = $table->newEntity([
                'access_id' => $accessId,
                'name' => $this->stringVal($row['Nazov'] ?? null),
                'country_id' => $this->resolveFk('Countries', $this->intVal($row['StatID'] ?? null)),
                'email1' => $this->stringVal($row['email1'] ?? null),
                'email2' => $this->stringVal($row['email2'] ?? null),
                'www' => $this->stringVal($row['www'] ?? null),
            ]);
            if ($table->save($entity)) {
                $this->rememberAccessId('Clubs', $accessId, (int)$entity->id);
                $inserted++;
            }
        }

        return $inserted;
    }

    private function importPeople(): int
    {
        $table = $this->fetchTable('People');
        $inserted = 0;
        foreach ($this->reader->fetchTable('tblOsoby') as $row) {
            $accessId = $this->intVal($row['ID'] ?? null);
            if ($accessId === null || $this->existsAccessId($table, $accessId)) {
                continue;
            }
            $entity = $table->newEntity([
                'access_id' => $accessId,
                'first_name' => $this->stringVal($row['Meno'] ?? null),
                'last_name' => $this->stringVal($row['Priezvisko'] ?? null),
                'club_id' => $this->resolveFk('Clubs', $this->intVal($row['KlubID'] ?? null)),
                'country_id' => $this->resolveFk('Countries', $this->intVal($row['StatID'] ?? null)),
                'gender_id' => $this->intVal($row['PohlavieID'] ?? null),
                'phone' => $this->stringVal($row['Telefon'] ?? null),
                'email1' => $this->stringVal($row['email1'] ?? null),
                'email2' => $this->stringVal($row['email2'] ?? null),
                'active' => $this->boolVal($row['Aktivny'] ?? false),
            ]);
            if ($table->save($entity)) {
                $this->rememberAccessId('People', $accessId, (int)$entity->id);
                $inserted++;
            }
        }

        return $inserted;
    }

    private function importCompetitions(): int
    {
        $table = $this->fetchTable('Competitions');
        $inserted = 0;
        foreach ($this->reader->fetchTable('tblSutaze') as $row) {
            $accessId = $this->intVal($row['ID'] ?? null);
            if ($accessId === null || $this->existsAccessId($table, $accessId)) {
                continue;
            }
            $entity = $table->newEntity([
                'access_id' => $accessId,
                'name' => $this->stringVal($row['Nazov'] ?? null),
                'subtitle' => $this->stringVal($row['Privlastok'] ?? null),
                'place' => $this->stringVal($row['Miesto'] ?? null),
                'organizer' => $this->stringVal($row['Usporiadatel'] ?? null),
                'status' => $this->stringVal($row['Status'] ?? null),
                'event_date' => $this->dateTimeVal($row['Datum'] ?? null),
                'competition_start' => $this->dateTimeVal($row['StartSutaz'] ?? null),
                'competition_end' => $this->dateTimeVal($row['KoniecSutaz'] ?? null),
                'filling_start' => $this->dateTimeVal($row['StartPlenenie'] ?? null),
                'pipe' => $this->stringVal($row['Fajka'] ?? null),
                'tobacco' => $this->stringVal($row['Tabak'] ?? null),
                'chief_referee' => $this->stringVal($row['HlavnyRozhodca'] ?? null),
                'competition_director' => $this->stringVal($row['RiaditelSutaze'] ?? null),
                'person3' => $this->stringVal($row['Osoba3'] ?? null),
                'last_master_pc' => $this->stringVal($row['LastMasterPC'] ?? null),
                'diploma_name1' => $this->stringVal($row['DiplomMeno1'] ?? null),
                'diploma_name2' => $this->stringVal($row['DiplomMeno2'] ?? null),
                'diploma_name3' => $this->stringVal($row['DiplomMeno3'] ?? null),
                'diploma_name4' => $this->stringVal($row['DiplomMeno4'] ?? null),
                'diploma_role1' => $this->stringVal($row['DiplomFunkcia1'] ?? null),
                'diploma_role2' => $this->stringVal($row['DiplomFunkcia2'] ?? null),
                'diploma_role3' => $this->stringVal($row['DiplomFunkcia3'] ?? null),
                'diploma_role4' => $this->stringVal($row['DiplomFunkcia4'] ?? null),
                'diploma_text1' => $this->stringVal($row['DiplomText1'] ?? null),
                'diploma_text2' => $this->stringVal($row['DiplomText2'] ?? null),
                'teams_enabled' => $this->boolVal($row['Druzstva'] ?? false),
                'payment_tracking' => $this->boolVal($row['EvidovatPlatbu'] ?? false),
                'tables_tracking' => $this->boolVal($row['EvidovatStoly'] ?? false),
                'competition_active' => $this->boolVal($row['SutazAktivna'] ?? false),
                'competition_finished' => $this->boolVal($row['SutazUkoncena'] ?? false),
                'registration_closed' => $this->boolVal($row['RegistraciaUzavreta'] ?? false),
                'auto_register' => $this->boolVal($row['RegistrovatAutomaticky'] ?? false),
                'filling_active' => $this->boolVal($row['PlnenieAktivne'] ?? false),
                'filling_finished' => $this->boolVal($row['PlnenieUkoncene'] ?? false),
                'preprinted_cards' => $this->boolVal($row['PredtlacenaKS'] ?? false),
                'world_class' => $this->boolVal($row['WorldClass'] ?? false),
                'max_registration_number' => $this->intVal($row['MaxPrihlasenyCislo'] ?? null),
                'max_competition_number' => $this->intVal($row['MaxSutazneCislo'] ?? null),
                'team_num_min' => $this->intVal($row['TeamNumMin'] ?? null),
                'team_num_max' => $this->intVal($row['TeamNumMax'] ?? null),
                'team_num_eval' => $this->intVal($row['TeamNumEval'] ?? null),
                'competitor_card_type' => $this->intVal($row['TypKartySutaziaceho'] ?? null),
                'fee_currency' => $this->stringVal($row['ZaplSumaMena'] ?? null),
                'logo_competition' => $this->binaryVal($row['LogoSutaz'] ?? null),
                'logo_club' => $this->binaryVal($row['LogoKlub'] ?? null),
            ]);
            if ($table->save($entity)) {
                $this->rememberAccessId('Competitions', $accessId, (int)$entity->id);
                $inserted++;
            }
        }

        return $inserted;
    }

    private function linkCompetitionReferences(): int
    {
        $table = $this->fetchTable('Competitions');
        $updated = 0;
        foreach ($this->reader->fetchTable('tblSutaze') as $row) {
            $accessId = $this->intVal($row['ID'] ?? null);
            if ($accessId === null) {
                continue;
            }
            $entity = $table->find()->where(['access_id' => $accessId])->first();
            if ($entity === null) {
                continue;
            }
            $payload = [
                'vl_individuals_id' => $this->resolveFk('Competitions', $this->intVal($row['VLIndividualsID'] ?? null)),
                'vl_teams_id' => $this->resolveFk('Competitions', $this->intVal($row['VLTeamsID'] ?? null)),
                'vl_women_id' => $this->resolveFk('Competitions', $this->intVal($row['VLWomenID'] ?? null)),
                'published_competition_id' => $this->resolveFk('Competitions', $this->intVal($row['PublishedID'] ?? null)),
            ];
            $dirty = false;
            foreach ($payload as $field => $value) {
                if ($entity->get($field) !== $value) {
                    $dirty = true;
                    break;
                }
            }
            if (!$dirty) {
                continue;
            }
            $entity = $table->patchEntity($entity, $payload, ['accessibleFields' => array_fill_keys(array_keys($payload), true)]);
            if ($table->save($entity)) {
                $updated++;
            }
        }

        return $updated;
    }

    private function importTeams(): int
    {
        $table = $this->fetchTable('Teams');
        $inserted = 0;
        foreach ($this->reader->fetchTable('tblDruzstva') as $row) {
            $accessId = $this->intVal($row['ID'] ?? null);
            if ($accessId === null || $this->existsAccessId($table, $accessId)) {
                continue;
            }
            $entity = $table->newEntity([
                'access_id' => $accessId,
                'competition_id' => $this->resolveFk('Competitions', $this->intVal($row['SutazID'] ?? null)),
                'name' => $this->stringVal($row['Nazov'] ?? null),
                'order_number' => $this->intVal($row['PoradoveCislo'] ?? null),
                'is_qualified' => $this->boolVal($row['JeKvalifikovane'] ?? false),
                'final_rank' => $this->intVal($row['KonecnePoradie'] ?? null),
                'result_time' => $this->dateTimeVal($row['VyslednyCas'] ?? null),
                'contestant_c1' => $this->intVal($row['SutaziaciC1'] ?? null),
                'contestant_c2' => $this->intVal($row['SutaziaciC2'] ?? null),
                'contestant_c3' => $this->intVal($row['SutaziaciC3'] ?? null),
            ]);
            if ($table->save($entity)) {
                $this->rememberAccessId('Teams', $accessId, (int)$entity->id);
                $inserted++;
            }
        }

        return $inserted;
    }

    private function importSeatingTables(): int
    {
        $table = $this->fetchTable('SeatingTables');
        $inserted = 0;
        foreach ($this->reader->fetchTable('tblStoly') as $row) {
            $accessId = $this->intVal($row['ID'] ?? null);
            if ($accessId === null || $this->existsAccessId($table, $accessId)) {
                continue;
            }
            $entity = $table->newEntity([
                'access_id' => $accessId,
                'competition_id' => $this->resolveFk('Competitions', $this->intVal($row['SutazID'] ?? null)),
                'number' => $this->intVal($row['Cislo'] ?? null),
                'seat_count' => $this->intVal($row['PocetMiest'] ?? null),
                'referee_fixed' => $this->stringVal($row['RozhodcaFix'] ?? null),
            ]);
            if ($table->save($entity)) {
                $this->rememberAccessId('SeatingTables', $accessId, (int)$entity->id);
                $inserted++;
            }
        }

        return $inserted;
    }

    private function importRegistrations(): int
    {
        $table = $this->fetchTable('Registrations');
        $inserted = 0;
        foreach ($this->reader->fetchTable('tblPrihlaseni') as $row) {
            $accessId = $this->intVal($row['ID'] ?? null);
            if ($accessId === null || $this->existsAccessId($table, $accessId)) {
                continue;
            }
            $entity = $table->newEntity([
                'access_id' => $accessId,
                'competition_id' => $this->resolveFk('Competitions', $this->intVal($row['SutazID'] ?? null)),
                'person_id' => $this->resolveFk('People', $this->intVal($row['OsobyID'] ?? null)),
                'club_id' => $this->resolveFk('Clubs', $this->intVal($row['KlubID'] ?? null)),
                'country_id' => $this->resolveFk('Countries', $this->intVal($row['StatID'] ?? null)),
                'team_id' => $this->resolveFk('Teams', $this->intVal($row['DruzstvoID'] ?? null)),
                'registration_number' => $this->intVal($row['PrihlasenyCislo'] ?? null),
                'competition_number' => $this->intVal($row['SutazneCislo'] ?? null),
                'table_number' => $this->intVal($row['StolCislo'] ?? null),
                'final_rank' => $this->intVal($row['KonecnePoradie'] ?? null),
                'final_rank_women' => $this->intVal($row['KonecnePoradieZeny'] ?? null),
                'result_time' => $this->dateTimeVal($row['VyslednyCas'] ?? null),
                'fee_amount' => $this->decimalVal($row['ZaplSuma'] ?? null),
                'email' => $this->stringVal($row['Email'] ?? null),
                'disqualification_reason' => $this->stringVal($row['DovodDiskvalifikacie'] ?? null),
                'note1' => $this->stringVal($row['Pozn1'] ?? null),
                'note2' => $this->stringVal($row['Pozn2'] ?? null),
                'access_last_modified' => $this->dateTimeVal($row['LastModified'] ?? null),
                'disqualified' => $this->boolVal($row['Diskvalifikacia'] ?? false),
                'team_scored' => $this->boolVal($row['DruzstvoJeHodnotene'] ?? false),
                'team_qualified' => $this->boolVal($row['DruzstvoJeKvalifikovane'] ?? false),
                'team_top3' => $this->boolVal($row['DruzstvoTop3'] ?? false),
                'email_sent' => $this->boolVal($row['EmailPoslany'] ?? false),
                'expo' => $this->boolVal($row['Expo'] ?? false),
                'gala' => $this->boolVal($row['Gala'] ?? false),
                'payment_ok' => $this->boolVal($row['PlatbaOK'] ?? false),
                'presidents_dinner' => $this->boolVal($row['PresidentsDinner'] ?? false),
                'present' => $this->boolVal($row['Pritomny'] ?? false),
                'finished' => $this->boolVal($row['Skoncil'] ?? false),
                'competing' => $this->boolVal($row['Sutaz'] ?? false),
            ]);
            if ($table->save($entity)) {
                $this->rememberAccessId('Registrations', $accessId, (int)$entity->id);
                $inserted++;
            }
        }

        return $inserted;
    }

    private function importCompetitionLocks(): int
    {
        $table = $this->fetchTable('CompetitionLocks');
        $inserted = 0;
        foreach ($this->reader->fetchTable('tblLock') as $row) {
            $accessId = $this->intVal($row['Identifikácia'] ?? $row['Identifikacia'] ?? null);
            if ($accessId === null || $this->existsAccessId($table, $accessId)) {
                continue;
            }
            $entity = $table->newEntity([
                'access_id' => $accessId,
                'competition_id' => $this->resolveFk('Competitions', $this->intVal($row['SutazID'] ?? null)),
                'max_team_number' => $this->intVal($row['MaxCisloDruzstva'] ?? null),
                'max_table_number' => $this->intVal($row['MaxCisloStola'] ?? null),
                'max_registration_number' => $this->intVal($row['MaxPrihlasenyCislo'] ?? null),
                'max_competition_number' => $this->intVal($row['MaxSutazneCislo'] ?? null),
            ]);
            if ($table->save($entity)) {
                $this->rememberAccessId('CompetitionLocks', $accessId, (int)$entity->id);
                $inserted++;
            }
        }

        return $inserted;
    }

    private function importSettings(): int
    {
        $table = $this->fetchTable('SmokeTimerSettings');
        $inserted = 0;
        foreach ($this->reader->fetchTable('tblSettings') as $row) {
            $accessId = $this->intVal($row['ID'] ?? null);
            if ($accessId === null || $this->existsAccessId($table, $accessId)) {
                continue;
            }
            $entity = $table->newEntity([
                'access_id' => $accessId,
                'database_id' => $this->stringVal($row['DatabazaID'] ?? null),
                'db_version' => $this->stringVal($row['VerziaDB'] ?? null),
                'last_competition_access_id' => $this->intVal($row['PoslednaSutaz'] ?? null),
                'lock_registrations' => $this->boolVal($row['LockPrihlaseni'] ?? false),
                'use_translation' => $this->boolVal($row['PouzitPreklad'] ?? false),
            ]);
            if ($table->save($entity)) {
                $this->rememberAccessId('SmokeTimerSettings', $accessId, (int)$entity->id);
                $inserted++;
            }
        }

        return $inserted;
    }

    private function existsAccessId(object $table, int $accessId): bool
    {
        return $table->find()
            ->where(['access_id' => $accessId])
            ->select(['id'])
            ->enableHydration(false)
            ->first() !== null;
    }

    private function resolveFk(string $alias, ?int $accessId): ?int
    {
        if ($accessId === null || $accessId <= 0) {
            return null;
        }
        if (isset($this->accessIdToMysqlId[$alias][$accessId])) {
            return $this->accessIdToMysqlId[$alias][$accessId];
        }

        $table = $this->fetchTable($alias);
        $row = $table->find()
            ->where(['access_id' => $accessId])
            ->select(['id'])
            ->enableHydration(false)
            ->first();
        if ($row === null) {
            return null;
        }

        $mysqlId = (int)$row['id'];
        $this->rememberAccessId($alias, $accessId, $mysqlId);

        return $mysqlId;
    }

    private function rememberAccessId(string $alias, int $accessId, int $mysqlId): void
    {
        $this->accessIdToMysqlId[$alias][$accessId] = $mysqlId;
    }

    private function intVal(mixed $value): ?int
    {
        if ($value === null || $value === '') {
            return null;
        }

        return (int)$value;
    }

    private function decimalVal(mixed $value): ?string
    {
        if ($value === null || $value === '') {
            return null;
        }

        return (string)$value;
    }

    private function boolVal(mixed $value): bool
    {
        if ($value === null) {
            return false;
        }
        if (is_bool($value)) {
            return $value;
        }
        if (is_numeric($value)) {
            return (int)$value !== 0;
        }

        $normalized = strtolower(trim((string)$value));

        return in_array($normalized, ['1', 'true', 'yes', 'on', '-1'], true);
    }

    private function dateTimeVal(mixed $value): ?DateTime
    {
        if ($value === null || $value === '') {
            return null;
        }
        if ($value instanceof DateTimeInterface) {
            return new DateTime($value->format('Y-m-d H:i:s'));
        }

        $string = trim((string)$value);
        if ($string === '') {
            return null;
        }

        return new DateTime($string);
    }

    private function binaryVal(mixed $value): ?string
    {
        if ($value === null || $value === '') {
            return null;
        }
        if (is_resource($value)) {
            $content = stream_get_contents($value);

            return $content === false ? null : $content;
        }

        return is_string($value) ? $value : null;
    }

    private function stringVal(mixed $value): ?string
    {
        if ($value === null || $value === '') {
            return null;
        }
        if (is_resource($value)) {
            $content = stream_get_contents($value);
            if ($content === false) {
                return null;
            }
            $value = $content;
        }
        $string = trim((string)$value);
        if ($string === '') {
            return null;
        }

        if (!mb_check_encoding($string, 'UTF-8')) {
            $converted = @iconv('Windows-1250', 'UTF-8//IGNORE', $string);
            if ($converted !== false) {
                return $converted;
            }
            $converted = @iconv('ISO-8859-2', 'UTF-8//IGNORE', $string);
            if ($converted !== false) {
                return $converted;
            }
        }

        return $string;
    }
}