# oklevelnyomtatas

Webes alkalmazás pipázóverseny-adatokból **PDF oklevelek** és **eredménylisták** nyomtatásához: a SmokeTimer **Microsoft Access** állomány (`SmokeTimerDB.accdb`) importálható **MySQL**-be, innen kezelhető a versenyadat, generálhatók az oklevelek és listák.

**Technológia:** CakePHP 5, JeffAdmin felület, Dompdf.

**Forráskód:** [https://github.com/kavezoo/oklevelnyomtatas.git](https://github.com/kavezoo/oklevelnyomtatas.git)

## Forrás és kiadás

| Mező | Érték |
|------|--------|
| **Alapértelmezett ág** | `main` — éles, telepíthető állapot |
| **Első release** | A repóba feltöltött verzióból készül; a kiadások a GitHub **Releases** oldalon jelennek meg |

```bash
git clone https://github.com/kavezoo/oklevelnyomtatas.git
cd oklevelnyomtatas
```

Opcionálisan címkézett kiadás: GitHub **Releases** → letöltés, vagy `git checkout` a release címkére.

## Dokumentáció

| Dokumentum | Cél |
|------------|-----|
| [**Egyszerű telepítés**](Doc/uzemeltetoi/telepites-gyors-utmutato.md) | Lépésről lépésre: letöltések, séma (**SQL** vagy **migráció**), indítás böngészőben |
| [Telepítés és használat (XAMPP)](Doc/uzemeltetoi/telepites-es-hasznalat-xampp.md) | Részletes: Composer, MySQL, Apache, lokális domain, Access ODBC, php.ini |
| [Használat — rövid áttekintés](Doc/uzemeltetoi/hasznalat.md) | Tipikus munkafolyamat a telepítés után (import, oklevelek, PDF) |

**Adatbázis:** MySQL/MariaDB név `oklevelnyomtatas` — séma **kétféleképpen:** `config/schema/oklevelnyomtatas.sql` import, vagy `php bin/cake.php migrations migrate` (részletek a telepítési doksiban; a két módszert ne kombináld ugyanazon az üres/félkész adatbázison).

## Rövid funkciók

- Access `.accdb` feltöltés és inkrementális import MySQL-be
- Regisztrációk, személyek, csapatok szerkesztése
- Egyéni és csapat oklevelek PDF
- Verseny- és éves eredménylisták PDF
- Generált PDF-ek listázása, letöltése, törlése

## Licenc

A projekt MIT licenc alatt áll (CakePHP app skeleton örökség); a SmokeTimer Access adatmodell és állomány külön jogi hatály alá tartozik.