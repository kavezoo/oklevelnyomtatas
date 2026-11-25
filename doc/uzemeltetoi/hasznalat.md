- **Típus:** üzemeltetői
- **Alkalmazás:** oklevelnyomtatas
- **Verzió:** 1.0
- **Dátum:** 2026-11-25
- **Állapot:** érvényes
- **Felelős:** oklevelnyomtatas fejlesztés

# Használat — rövid áttekintés

**Tároló:** [https://github.com/kavezoo/oklevelnyomtatas.git](https://github.com/kavezoo/oklevelnyomtatas.git)  
**Telepítés:** lásd [telepites-es-hasznalat-xampp.md](telepites-es-hasznalat-xampp.md). Fejlesztéshez `dev` ág; a végleges használható változat később a `main` ágon és release formájában érhető el.

## Fő menüpontok

| Menü | Feladat |
|------|---------|
| Oklevél generálás | Verseny választás, egyéni / csapat PDF oklevelek |
| Generált PDF-ek | Letöltés, törlés |
| Regisztrációk / idő | Versenyeredmények, idők szerkesztése |
| Személyek, Csapatok | Törzsadatok |
| Access import | `.accdb` feltöltés, MySQL import |
| Eredménylisták (PDF) | Verseny- és éves táblázatok (általában év végén) |

## Jellemző munkafolyamat

1. **Access import** — új vagy frissített `SmokeTimerDB.accdb` feltöltése (a régi mentésre kerül).
2. **Import MySQL-be** — csak **új** Access rekordok (`access_id` alapján).
3. Szükség esetén **regisztrációk / csapatok** javítása a weben.
4. **Oklevél generálás** — szervező pipaklub megadása, indulók / csapatok kijelölése.
5. **Eredménylisták** — verseny szerinti vagy éves összesítő PDF.
6. **Generált PDF-ek** — fájlok kezelése a `webroot/pdf` mappában.

## Kimeneti fájlok

| Típus | Hely | Elnevezés (minta) |
|-------|------|-------------------|
| Oklevelek | `webroot/pdf/` | egyéni / csapat fájlnevek verseny és klub szerint |
| Eredménylisták | `webroot/pdf/` | `egyeni_eredmenylist_*`, `csapat_eves_osszesito_*`, stb. |
| Access másolat | `db/` | `SmokeTimerDB_YYYYMMDD_HHMMSS.accdb` |

## Megjegyzések

- Az aktív Access fájl zárolva van, amíg az ODBC kapcsolat nyitva — feltöltés előtt zárd be a Microsoft Access programot, ha a régi fájlt zárolja.
- A `dev` ág funkciói változhatnak; éles üzemhez a későbbi `main` + GitHub release ajánlott.