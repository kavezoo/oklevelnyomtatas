- **Típus:** üzemeltetői
- **Alkalmazás:** oklevelnyomtatas
- **Verzió:** 1.1
- **Dátum:** 2026-11-25
- **Állapot:** érvényes
- **Felelős:** oklevelnyomtatas fejlesztés

# Telepítés és üzemeltetés — Windows, XAMPP

## Cél

Az **oklevelnyomtatas** webalkalmazás üzembe helyezése fejlesztői / helyi környezetben: **Apache + PHP 8.2+ + MySQL**, adatbázis séma az **`config/schema/oklevelnyomtatas.sql`** fájlból, SmokeTimer Access állomány olvasása **ODBC**-vel.

**Gyors telepítés (lépésről lépésre):** [telepites-gyors-utmutato.md](telepites-gyors-utmutato.md)

## Forráskód — GitHub

| Mező | Érték |
|------|--------|
| **Tároló** | [https://github.com/kavezoo/oklevelnyomtatas.git](https://github.com/kavezoo/oklevelnyomtatas.git) |
| **Fejlesztői ág** | `dev` (jelenleg innen telepíthető) |
| **Stabil ág** | `main` — későbbi, végleges használható változat; innen lesz **release** is |

```bat
git clone https://github.com/kavezoo/oklevelnyomtatas.git
cd oklevelnyomtatas
git checkout dev
```

**Munkakönyvtár példa:** `D:\www\oklevelnyomtatas`

## Előfeltételek és letöltések

| Komponens | Követelmény | Letöltés |
|-----------|-------------|----------|
| Operációs rendszer | Windows 10/11 (64 bites ajánlott) | — |
| XAMPP | PHP **8.2 vagy újabb** (a repó `composer.json` szerint) | [apachefriends.org — XAMPP for Windows](https://www.apachefriends.org/download.html) |
| Composer | 2.x | [Composer-Setup.exe](https://getcomposer.org/Composer-Setup.exe) · [dokumentáció](https://getcomposer.org/download/) |
| Git | Forráskód klónozásához | [git-scm.com — Windows](https://git-scm.com/download/win) |
| MySQL / MariaDB | XAMPP csomaggal (Control Panel: MySQL Start) | (XAMPP része) |
| Microsoft Access Database Engine | **ACE** ODBC illesztő — bitness = PHP bitness (lásd ACE szakasz) | [ACE 2016 Redistributable (64-bit)](https://www.microsoft.com/en-us/download/details.aspx?id=54920) |

## Composer — függőségek

```bat
cd D:\www\oklevelnyomtatas
composer install
```

Éles / stabil környezetben:

```bat
composer install --no-dev --optimize-autoloader
```

## MySQL adatbázis — `oklevelnyomtatas`

**Adatbázis neve (kötelező példa telepítéshez):** `oklevelnyomtatas`

**Séma forrása (táblák + induló adatok):**

| Mező | Érték |
|------|--------|
| **Fájl** | `config/schema/oklevelnyomtatas.sql` |
| **Tartalom** | `CREATE DATABASE`, `USE oklevelnyomtatas`, táblák, indexek, induló adatok (dump) |

**Művelet:** SQL fájl futtatása  
**Futtató:** MySQL root vagy jogosult felhasználó  
**Munkakönyvtár:** projekt gyökér (a fájl abszolút útvonala számít)  
**Kimenet:** létező `oklevelnyomtatas` adatbázis, alkalmazás által használt táblák  
**Hibakezelés:** „database exists” / duplicate → üres DB-n futtasd; jog hiánya → `GRANT`

### phpMyAdmin

1. [http://localhost/phpmyadmin](http://localhost/phpmyadmin)
2. **Import** → fájl: `D:\www\oklevelnyomtatas\config\schema\oklevelnyomtatas.sql` → **Go**

### `mysql` CLI (XAMPP)

```bat
C:\xampp\mysql\bin\mysql.exe -u root < D:\www\oklevelnyomtatas\config\schema\oklevelnyomtatas.sql
```

Opcionálisan **csak** üres adatbázis (ha a táblákat máshonnan töltöd — nem ajánlott):

```sql
CREATE DATABASE oklevelnyomtatas
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
```

Opcionálisan külön felhasználó (ajánlott élesben):

```sql
CREATE USER 'oklevelnyomtatas'@'localhost' IDENTIFIED BY 'erős-jelszó';
GRANT ALL PRIVILEGES ON oklevelnyomtatas.* TO 'oklevelnyomtatas'@'localhost';
FLUSH PRIVILEGES;
```

A `config/app_local.php` `Datasources.default.database` mezője legyen **`oklevelnyomtatas`** (vagy az általad használt név, ha szándékosan más).

## CakePHP helyi konfiguráció

**Művelet:** `config/app_local.php` létrehozása  
**Futtató:** fejlesztő / üzemeltető  
**Munkakönyvtár:** `D:\www\oklevelnyomtatas\config`  
**Paraméterek:** MySQL host, user, jelszó, adatbázisnév, `Security.salt`, opcionálisan `App.fullBaseUrl`  
**Kimenet:** az alkalmazás eléri a MySQL-t  
**Hibakezelés:** a fájl **nem** kerül gitbe — ne commitolj jelszót

1. Másold: `config/app_local.example.php` → `config/app_local.php`
2. Állítsd be a `Datasources.default` blokkot, példa XAMPP-hoz:

```php
'username' => 'root',
'password' => '',
'database' => 'oklevelnyomtatas',
```

3. Fejlesztésnél: `'debug' => true`
4. Lokális domain esetén (lásd 6. szakasz):

```php
'App' => [
    'fullBaseUrl' => 'http://oklevel.local',
],
```

vagy környezeti változó: `APP_FULL_BASE_URL=http://oklevel.local`

**Fontos:** a `config/smoke_timer.php` (Access útvonalak, ODBC név) csak akkor töltődik, ha létezik az `app_local.php` — ez a projekt bootstrap sorrendje.

## Adatbázis séma — ellenőrzés

Telepítés után phpMyAdmin-ban az `oklevelnyomtatas` adatbázisban látszanak a táblák (pl. `countries`, `clubs`, `people`, `competitions`, `teams`, `registrations`).

**CakePHP migráció** (`php bin\cake.php migrations migrate`) **nem** része az alap telepítésnek, ha a fenti SQL import sikeres. A fejlesztői ágon későbbi séma-változás lehet külön migrációs fájlban — ilyenkor a fejlesztői changelog / issue szerint járj el.

## Írható mappák

Ellenőrizd, hogy a webszerver folyamat írhat:

| Mappa | Cél |
|-------|-----|
| `tmp/` | CakePHP cache |
| `logs/` | naplók |
| `db/` | Access `.accdb`, `active_access_path.txt`, `backups/` |
| `webroot/pdf/` | generált PDF-ek |

## Apache (XAMPP) — virtuális host

**DocumentRoot:** mindig a **`webroot`** mappa (CakePHP belépési pont: `webroot/index.php`).

### 1. `hosts` fájl

**Útvonal:** `C:\Windows\System32\drivers\etc\hosts`  
**Jogosultság:** rendszergazda (Jegyzettömb „Futtatás rendszergazdaként”)

Példa sor:

```text
127.0.0.1   oklevel.local
```

### 2. Virtual host — `httpd-vhosts.conf`

**Fájl:** `C:\xampp\apache\conf\extra\httpd-vhosts.conf` (XAMPP alapértelmezett útvonal)

```apache
<VirtualHost *:80>
    ServerName oklevel.local
    DocumentRoot "D:/www/oklevelnyomtatas/webroot"

    <Directory "D:/www/oklevelnyomtatas/webroot">
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog "logs/oklevel-error.log"
    CustomLog "logs/oklevel-access.log" common
</VirtualHost>
```

### 3. Vhost és mod_rewrite bekapcsolása

`C:\xampp\apache\conf\httpd.conf`:

- `LoadModule rewrite_module modules/mod_rewrite.so` — ne legyen kommentezve
- `Include conf/extra/httpd-vhosts.conf` — engedélyezve

### 4. Újraindítás

XAMPP Control Panel → Apache **Stop** → **Start**.

**Ellenőrzés:** böngésző: `http://oklevel.local/` — az oklevelnyomtatas főoldal betölt.

### Beépített PHP szerver (gyors teszt, Apache nélkül)

```bat
cd D:\www\oklevelnyomtatas
php bin\cake.php server -H 0.0.0.0 -p 8765
```

Megnyitás: `http://localhost:8765` — virtuális host és `fullBaseUrl` ilyenkor opcionális.

## PHP beállítások (XAMPP)

**Fájl:** `C:\xampp\php\php.ini` (Apache újraindítás szükséges)

| Beállítás | Ajánlás | Megjegyzés |
|-----------|---------|------------|
| `extension=pdo_mysql` | bekapcsolva | MySQL |
| `extension=pdo_odbc` | bekapcsolva | Access ODBC olvasás |
| `extension=intl` | bekapcsolva | dátum / lokalizáció |
| `extension=mbstring` | bekapcsolva | szöveg |
| `extension=openssl` | bekapcsolva | HTTPS, Composer |
| `extension=zip` | bekapcsolva | függőségek |
| `extension=gd` | ajánlott | PDF / kép |

**Nagy Access feltöltés:** a globális `php.ini` értékei korlátozhatnak. Az alkalmazás az **Import → feltöltés** útvonalon megpróbálja emelni a limitet (16 GB alkalmazás-szinten, korlátlan script idő). Ha a feltöltés mégis megszakad, növeld:

```ini
upload_max_filesize = 16G
post_max_size = 16G
max_execution_time = 0
max_input_time = 0
memory_limit = 2048M
```

Nagyon nagy fájlnál az **Apache** `TimeOut` (és esetleg proxy timeout) is növelendő.

**Architektúra:** a PHP **bite-méretének** (32 / 64 bit) egyeznie kell az ACE telepítővel.

## Microsoft Access ODBC (ACE)

A webalkalmazás az **aktív** `.accdb` fájlt **PDO ODBC**-n olvassa (`AccessReader`), nem szükséges telepített Microsoft Access program a szerveren, de kell az illesztő:

| Név | Microsoft Access Database Engine 2016 Redistributable |
| Letöltés | [https://www.microsoft.com/en-us/download/details.aspx?id=54920](https://www.microsoft.com/en-us/download/details.aspx?id=54920) |
| Választás | **64 bites** ACE, ha a XAMPP PHP 64 bites (tipikus) |

Telepítés után az **ODBC Data Sources (64-bit)** listában megjelenik:

`Microsoft Access Driver (*.mdb, *.accdb)`

A projekt alapértelmezett neve (`config/smoke_timer.php`):

`Microsoft Access Driver (*.mdb, *.accdb)`

Eltérő név esetén környezeti változó:

`SMOKE_TIMER_ODBC_DRIVER`

### SmokeTimer Access állomány (forrás adat)

| Elem | Alapértelmezett |
|------|-----------------|
| Aktív fájl | `db/SmokeTimerDB.accdb` |
| Pointer | `db/active_access_path.txt` (feltöltés után időbélyeges fájlra mutat) |
| Mentések | `db/backups/` |

A **SmokeTimer** asztali program Access-ben készíti / karbantartja az adatbázist; az **oklevelnyomtatas** webes modul **importál** belőle. Az első futtatás előtt helyezz `.accdb`-t a `db/` mappába, vagy tölts fel a **Access import** oldalon.

## Első indulás — ellenőrzés

1. `composer install` kész
2. `app_local.php` + MySQL működik (`database` = `oklevelnyomtatas`)
3. `config/schema/oklevelnyomtatas.sql` importálva
4. Apache → `http://oklevel.local/` (vagy `php bin\cake.php server`)
5. **Access import:** feltöltés → **Import MySQL-be** (új `access_id` sorok)
6. **Oklevél generálás**, **Eredménylisták**, **Generált PDF-ek**

## Gyakori hibák

| Tünet | Valószínű ok |
|-------|----------------|
| „Nem sikerült megnyitni az Access fájlt ODBC-n” | Nincs ACE, vagy 32/64 bit eltérés, vagy `pdo_odbc` ki van kapcsolva |
| Feltöltés üres / hiba kód 1 | `upload_max_filesize` / `post_max_size` túl kicsi a `php.ini`-ben |
| Host hiba / rossz linkek | `App.fullBaseUrl` nem egyezik a böngésző címmel |
| SQL import hiba | Rossz MySQL jog, félbeszakadt import, duplicate táblák |
| Backup / törlés sikertelen | Access vagy más program zárolja a `.accdb`-t — zárd be |

## Kapcsolódó konfigurációs fájlok

| Fájl | Tartalom |
|------|----------|
| `config/app.php` | Közös CakePHP beállítások |
| `config/app_local.php` | DB, debug, salt, fullBaseUrl (gitignore) |
| `config/smoke_timer.php` | Access útvonal, ODBC név, PDF mappa |
| `config/.env.example` | Opcionális env változók mintája |

## Frissítés (kódváltozás után)

```bat
git pull
composer install
```

Ha a változás séma-módosítást is hoz, kövesd a release / fejlesztői utasítást (új SQL dump vagy migráció).

**Release / stabil:** `git checkout main` és a GitHub **Releases** oldala, amikor elérhető.

Apache újraindítás csak `php.ini` / vhost módosítás után szükséges.