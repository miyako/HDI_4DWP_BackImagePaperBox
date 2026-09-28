# HDI_4DWP_BackImagePaperBox

A 4D **HDI** (How Do I) example demonstrating how to programmatically insert a background image that fills the whole printable area of a **4D Write Pro** document, and how to control its clipping/origin box (paper box vs. border box).

## Origin

This project started as a binary `.4DB` example database originally distributed with 4D v16 R5. It was converted to the modern project architecture (`.4DProject`) using 4D 21's built-in binary-to-project conversion tool, then updated and cleaned up with the help of **GitHub Copilot**.

- **Blog post:** https://blog.4d.com/full-size-background-pictures-with-4d-write-pro/
- **Original download:** https://download.4d.com/Demos/4D_v16_R5/HDI_4DWP_BackImagePaperBox.zip

## What This Demonstrates

- Inserting a background image that fills the entire printable area of a 4D Write Pro document, via `WP SET ATTRIBUTES` (`wk background image`, `wk background repeat`).
- Controlling how the background image is **clipped** and **positioned**, using both the programmatic attributes (`wk background clip`, `wk background origin`) and the equivalent standard actions (`doc/backgroundClip`, `section/backgroundOrigin`, etc.).
- The difference between **paper box** and **border box** clipping/origin, and between applying the setting to the **whole document** vs. the **current section only**.
- Re-importing/re-exporting a 4D Write Pro document for editing (`WP Import document`, `WP EXPORT DOCUMENT`).

## Project Structure

| Path | Purpose |
|------|---------|
| `Project/Sources/Methods/00_Start.4dm` | Menu-invoked startup method; opens the splash window. |
| `Project/Sources/Forms/HDI` | Splash screen shown on startup (version/license checks, links to the demo). |
| `Project/Sources/Forms/HDI2` | Main demo form: **Info** tab plus **Demo 1** (standard-action based) and **Demo 2** (attribute based) tabs showing background image clipping/origin. |
| `Project/Sources/Forms/Edition` | A 4D Write Pro editing form used to re-open and re-save one of the example documents. |
| `Project/Sources/TableForms/1` | Legacy `Input`/`Output` forms bound to a `Countries` table that no longer exists in `catalog.4DCatalog` — inert leftover scaffolding, kept as-is (see Notes below). |
| `Resources/{lang}.lproj` | XLIFF translation files (English source + Japanese), grouped by menu / form / message. |

## Notes for Developers

This codebase went through a modernization pass (with GitHub Copilot) covering:

- **Localisation** — every form/menu/method string now resolves through `:xliff:` references or `Localized string(...)`, backed by XLIFF files under `Resources/`.
- **Language modernization** — all `C_*` variable directives were converted to `var`/`#DECLARE`, including the `Compiler_Variables`/`Compiler_Methods`/`Compiler_Arrays` metadata files.
- **Startup pattern** — `00_Start.4dm` uses `#DECLARE`, `CALL WORKER` (instead of `New process`), window-reuse detection, and a non-blocking `DIALOG(...; *)` instead of the older blocking-dialog + `CLOSE WINDOW` pattern.
- **Dark mode & Liquid Glass** — `styleSheets.css` adds `prefers-color-scheme` support (via `"automatic"` values and small CSS classes), and `styleSheets_mac.css` adds `form-theme: liquid-glass` / `mac-classic` button-height rules; all buttons share a single `default` CSS class.
- **Menus** — the legacy `m_Quit` method wrapper was replaced by the standard `"action": "quit"` menu property.
- **Method visibility** — subroutines, form-event handlers, and object methods are marked `invisible` so only real entry points (`00_Start`) show up in the Run Method dialog.

A couple of pre-existing quirks were found (and, where relevant, fixed) along the way:

- `HDI/method.4dm` referenced a nonexistent form object named `BtnDemo`; the actual button is `BtnDemo1` — this silent no-op was fixed and the transition logic moved into a dedicated `BtnDemo1.4dm` object method.
- `Compiler_Methods.4dm` declared a `FindCountries` method that does not exist anywhere in the project; this stale entry was removed.
- `TableForms/1/Input` and `TableForms/1/Output` reference a `[Countries:1]` table that isn't defined in the catalog; they are unused leftovers from the original demo and were left untouched.

## Requirements

- 4D 21 R1 or later (project uses `compatibilityVersion: 2101`).
- A valid 4D Write Pro license to run the demo end-to-end (the splash screen checks for this and shows an explanatory message if unavailable).

## References

- 4D Write Pro `WP SET ATTRIBUTES`: https://developer.4d.com/docs/commands/wp-set-attributes
- 4D Write Pro standard actions: https://developer.4d.com/docs/WritePro/writeProActions
- CSS in 4D forms: https://developer.4d.com/docs/FormEditor/stylesheets
- 4D project method properties: https://developer.4d.com/docs/Project/project-method-properties
