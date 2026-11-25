- **Típus:** üzemeltetői
- **Alkalmazás:** oklevelnyomtatas
- **Verzió:** 1.1
- **Dátum:** 2026-11-25
- **Állapot:** érvényes
- **Felelős:** fejlesztői csapat

# Oklevélnyomtatás — egyszerű telepítési útmutató

Rövid lépéssor Windows + XAMPP alatt. Részletes magyarázat, ODBC, virtuális host: [telepites-es-hasznalat-xampp.md](telepites-es-hasznalat-xampp.md).

## Szükséges programok (letöltés)

| Program | Szerep | Letöltés |
|---------|--------|----------|
| **XAMPP** (PHP 8.2+, MariaDB) | Apache, PHP, MySQL/MariaDB | [apachefriends.org — XAMPP for Windows](https://www.apachefriends.org/download.html) |
| **Git** | Forráskód klónozása | [git-scm.com — Windows](https://git-scm.com/download/win) |
| **Composer** | PHP csomagok (`vendor/`) | [getcomposer.org — Composer-Setup.exe](https://getcomposer.org/Composer-Setup.exe) |
| **Microsoft Access Database Engine (ACE)** | `.accdb` import (ODBC); **ugyanolyan bitness, mint a PHP** | [Microsoft OLE DB Driver for Access / ACE 2016 (64-bit)](https://www.microsoft.com/en-us/download/details.aspx?id=54920) vagy keresés: „Access Database Engine 2016 Redistributable” |

Opcionális: [7-Zip](https://www.7-zip.org/download.html) — ha nem Git-tel töltöd le a projektet.

---

## 1. lépés — XAMPP telepítése és indítása

1. XAMPP telepítése (alapértelmezett mappa: `C:\xampp`).
2. XAMPP Control Panel: **Apache** és **MySQL** → **Start** (mindkettő zöld).

---

## 2. lépés — Projekt a `htdocs` vagy saját mappába

**Git-tel (ajánlott):**

```text
cd D:\www
git clone https://github.com/kavezoo/oklevelnyomtatas.git
cd oklevelnyomtatas
```

A repó **`main`** ága az éles forrás; később opcionálisan letölthető GitHub **Release** is.

**Mappa név:** tetszőleges (pl. `D:\www\oklevelnyomtatas`). A dokumentációban ez az útvonal szerepel.

---

## 3. lépés — Composer függőségek

```text
cd D:\www\oklevelnyomtatas
composer install
```

Ha a `composer` parancs nem található: telepítsd a Composer Setup-ot, majd nyiss új parancssort.

---

## 4. lépés — Helyi konfiguráció

```text
cd D:\www\oklevelnyomtatas
copy config\app_local.example.php config\app_local.php
```

`config/app_local.php` — `Datasources.default` példa XAMPP-hoz:

| Mező | Érték |
|------|--------|
| host | `localhost` |
| username | `root` |
| password | `` (üres) vagy saját |
| database | **`oklevelnyomtatas`** |

Opcionális — SmokeTimer Access forrás (`Import` menü):

```php
'SmokeTimer' => [
    'path' => 'D:/www/oklevelnyomtatas/db/SmokeTimerDB.accdb',
],
```

---

## 5. lépés — Adatbázis séma: `oklevelnyomtatas`

Az alkalmazás MySQL/MariaDB adatbázis neve: **`oklevelnyomtatas`**.

**Válassz egy módszert** (elég az egyik; ugyanarra az adatbázisra ne futtasd mindkettőt):

| | **A) SQL import** | **B) CakePHP migráció** |
|---|-------------------|-------------------------|
| **Neki való** | phpMyAdmin-barát, „egy kattintás”, induló adatok a dumpból | Parancssoros, üres táblák, adat Access importból |
| **Fájl / parancs** | `config/schema/oklevelnyomtatas.sql` | `php bin\cake.php migrations migrate` |
| **Előfeltétel** | MySQL fut | MySQL fut + kész **`config/app_local.php`** (4. lépés) |
| **Adat** | Dumpban lévő országok, klubok, stb. (ha benne vannak) | Üres táblák — versenyadat **Access import** után |

### A) SQL import

Fájl:

```text
config/schema/oklevelnyomtatas.sql
```

**phpMyAdmin:** [http://localhost/phpmyadmin](http://localhost/phpmyadmin) → **Import** → a fenti fájl → **Go**.

**Parancssor (XAMPP):**

```text
C:\xampp\mysql\bin\mysql.exe -u root < D:\www\oklevelnyomtatas\config\schema\oklevelnyomtatas.sql
```

Alap XAMPP-on a root jelszó üres. Ha van jelszó: `-p`.

### B) Migráció (CakePHP Migrations)

1. Hozd létre az üres adatbázist (ha még nincs), pl. phpMyAdmin-ban vagy:

```sql
CREATE DATABASE oklevelnyomtatas
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
```

2. Projekt gyökérben:

```text
cd D:\www\oklevelnyomtatas
php bin\cake.php migrations migrate
```

Státusz ellenőrzés: `php bin\cake.php migrations status`.

Séma forrása: `config/Migrations/20261125100000_CreateSmokeTimerTables.php`.

---

## 6. lépés — Írható mappák

PowerShell (projekt gyökérben):

```powershell
New-Item -ItemType Directory -Force tmp, logs, webroot/files, webroot/access
```

Windows jogosultság: a futtató felhasználónak írnia kell a `tmp`, `logs`, `webroot/files`, `webroot/access` mappákba.

---

## 7. lépés — Alkalmazás indítása böngészőben

### A) Beépített PHP szerver (leggyorsabb teszt)

```text
cd D:\www\oklevelnyomtatas
php bin\cake.php server -H 127.0.0.1 -p 8765
```

Böngésző: **http://127.0.0.1:8765**

Leállítás: a konzolban `Ctrl+C`.

### B) XAMPP Apache + virtuális host (állandó használatra)

1. Apache DocumentRoot vagy VirtualHost mutasson a projekt `webroot` mappájára: `D:\www\oklevelnyomtatas\webroot`
2. Példa hostnév: `oklevel.local` (hosts fájl + vhost — lépések: [telepites-es-hasznalat-xampp.md](telepites-es-hasznalat-xampp.md))
3. Böngésző: **http://oklevel.local**

### C) Közvetlen `webroot` (egyszerű, de nem minden URL működik jól)

**http://localhost/oklevelnyomtatas/webroot/** — csak ha a projekt az `htdocs` alatt van és nincs rewrite; éles használatra az **A)** vagy **B)** ajánlott.

---

## 8. lépés — Bejelentkezés és használat

1. Első indítás után a bejelentkező képernyő jelenik meg (JeffAdmin).
2. Alapértelmezett admin (ha a séma SQL-ben benne van): felhasználónév és jelszó a fejlesztői/üzemeltetői belső listán — **éles környezetben azonnal cseréld**.
3. Menü sorrend (röviden):
   - **Oklevél generálás** — PDF oklevelek
   - **Access feltöltés** — nagy `.accdb` (ACE ODBC szükséges)
   - **Eredménylisták** — letölthető listák, PDF

Használati részletek: [hasznalat.md](hasznalat.md).

---

## Ellenőrző lista

| # | Kész? | Mit nézz |
|---|--------|----------|
| 1 | ☐ | Apache + MySQL fut (XAMPP) |
| 2 | ☐ | `composer install` lefutott |
| 3 | ☐ | `config/app_local.php` → `database` = `oklevelnyomtatas` |
| 4 | ☐ | Séma kész (**SQL import** *vagy* **migrations migrate**) |
| 5 | ☐ | `tmp`, `logs`, `webroot/files` írható |
| 6 | ☐ | Böngészőben megnyílik a kezdőlap |
| 7 | ☐ | (Importhoz) ACE ODBC telepítve, bitness = PHP bitness |

---

## Gyakori hibák

| Tünet | Megoldás |
|--------|----------|
| Adatbázis kapcsolat hiba | Ellenőrizd: MySQL fut, név `oklevelnyomtatas`, `app_local.php` |
| 404 / üres oldal Apache-nál | `mod_rewrite`, DocumentRoot = `webroot` |
| Access import nem megy | ACE telepítés; PHP és ACE egyaránt 32 vagy 64 bit |
| Feltöltés timeout | `doc/uzemeltetoi/telepites-es-hasznalat-xampp.md` — `php.ini` limiték |

---

## További dokumentáció

- [README.md](../../README.md) — áttekintés, GitHub
- [telepites-es-hasznalat-xampp.md](telepites-es-hasznalat-xampp.md) — részletes XAMPP, ODBC, php.ini
- [hasznalat.md](hasznalat.md) — funkciók, menük, PDF