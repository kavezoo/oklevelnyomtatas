# oklevelnyomtatas

Webes alkalmazás pipázóverseny-adatokból **PDF oklevelek** és **eredménylisták** nyomtatásához: a SmokeTimer **Microsoft Access** állomány (`SmokeTimerDB.accdb`) importálható **MySQL**-be, innen kezelhető a versenyadat, generálhatók az oklevelek és listák.

**Technológia:** CakePHP 5, JeffAdmin felület, Dompdf.

**Forráskód:** [https://github.com/kavezoo/oklevelnyomtatas.git](https://github.com/kavezoo/oklevelnyomtatas.git)

## Ágak és kiadás

| Ág | Állapot |
|----|---------|
| **`dev`** | Aktuális fejlesztés — innen telepíts most |
| **`main`** | Későbbi, **végleges, használható** változat; innen lesz majd a **release** is |

```bash
git clone https://github.com/kavezoo/oklevelnyomtatas.git
cd oklevelnyomtatas
git checkout dev
```

## Dokumentáció

| Dokumentum | Cél |
|------------|-----|
| [**Egyszerű telepítés**](Doc/uzemeltetoi/telepites-gyors-utmutato.md) | Lépésről lépésre: letöltések, `oklevelnyomtatas.sql`, indítás böngészőben |
| [Telepítés és használat (XAMPP)](Doc/uzemeltetoi/telepites-es-hasznalat-xampp.md) | Részletes: Composer, MySQL, Apache, lokális domain, Access ODBC, php.ini |
| [Használat — rövid áttekintés](Doc/uzemeltetoi/hasznalat.md) | Tipikus munkafolyamat a telepítés után (import, oklevelek, PDF) |

**Adatbázis:** MySQL/MariaDB név `oklevelnyomtatas` — séma: `config/schema/oklevelnyomtatas.sql` (import után futtatható az alkalmazás).

## Rövid funkciók

- Access `.accdb` feltöltés és inkrementális import MySQL-be
- Regisztrációk, személyek, csapatok szerkesztése
- Egyéni és csapat oklevelek PDF
- Verseny- és éves eredménylisták PDF
- Generált PDF-ek listázása, letöltése, törlése

## Licenc

A projekt MIT licenc alatt áll (CakePHP app skeleton örökség); a SmokeTimer Access adatmodell és állomány külön jogi hatály alá tartozik.