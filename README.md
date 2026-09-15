# HDI_4DWP_InsertPicture

A 4D **HDI** ("How Do I") sample project answering one question: *how do I insert a picture into a 4D Write Pro document by programming?* It demonstrates the `WP Insert picture` command with every insertion mode and range-extension option, inserting from both a local file and a database picture field.

## Overview

HDI projects are small, self-contained 4D demos, each built around a single practical question. Opening the project runs a splash screen (`HDI` form) which then leads into the actual demonstration (`HDI2` form). This project was originally distributed as a binary `.4DB` database for 4D v16 and has since been converted to the modern `.4DProject` architecture and modernised (project-mode syntax, XLIFF localisation, dark mode / Liquid Glass styling, etc.).

## Features

- **Insert a picture inline** into a 4D Write Pro document, sourced either from a file on disk (`Select document`) or from a `PICTURES` table picture field, using `WP Insert picture`.
- **Insertion mode** control via radio buttons: *Replace*, *Append*, *Prepend* (`wk replace`, `wk append`, `wk prepend`).
- **Range extension** control via radio buttons: *Include in range* / *Exclude from range* (`wk include in range`, `wk exclude from range`), showing how the inserted picture affects the surrounding text selection.
- **Background pictures** page, browsing the `PICTURES` table with Previous/Next record navigation and a `WP_Palette_Backgrounds` subform palette.
- **Localised UI** in English and Japanese via XLIFF, switching automatically based on `Get database localization`.
- **Dark mode and Liquid Glass** aware styling (macOS Tahoe), adapting text colours and button chrome automatically.

## Project structure

| Path | Purpose |
|------|---------|
| `Project/Sources/Forms/HDI` | Splash screen shown on startup; its `BtnDemo` button opens the main demo form. |
| `Project/Sources/Forms/HDI2` | Main demo form with two tabbed pages: *Inline pictures* and *Background pictures*. |
| `Project/Sources/Forms/HDI2/ObjectMethods` | Button/area logic: `Button`/`Button1` insert pictures (from file / from field), `Button5`/`Button6` navigate `PICTURES` records, `WParea` synchronises the 4D Write Pro area with its palette widget. |
| `Project/Sources/Methods/00_Start.4dm` | Startup entry point (menu- and application-launch method). |
| `Project/Sources/Methods/initHDI.4dm` | Loads localized sample text and imports demo data (`EXAMPLES`, `PICTURES`) on first run. |
| `Resources/*.lproj` | XLIFF translation files (`en`, `ja`) for menus, forms, and alert/dialog messages. |
| `Project/Sources/styleSheets*.css` | Cross-platform dark-mode and platform-specific (Liquid Glass / Fluent UI) form styling. |

## Points of interest

- **Non-blocking splash pattern** — `00_Start.4dm` uses `CALL WORKER` + non-blocking `DIALOG(...;*)` instead of spawning a dedicated process, and detects/re-focuses an already-open splash window rather than opening a duplicate.
- **Form-scoped state instead of interprocess variables** — the splash and demo forms communicate through the `Form` object (e.g. `Form.quit`) rather than `<>`-prefixed interprocess variables.
- **4D Write Pro area/widget synchronisation** — `WParea.4dm` shows the standard pattern for keeping a 4D Write Pro area and its companion palette widget (`WPwidget`) in sync across `On Load`, `On After Edit`, `On Selection Change`, and focus events.
- **Modern variable declarations** — all legacy `C_*` directives have been converted to `var`/`#DECLARE` syntax.
- **XLIFF-driven localisation** — every user-facing string (menu titles, form labels, alert/dialog text) is resolved through `:xliff:` references or `Localized string(...)`, with translations grouped by purpose (`menu*.xlf`, `HDI*.xlf`, `HDI2*.xlf`, `messages*.xlf`).
- **Adaptive CSS styling** — `stroke: automatic` keeps text legible in both light and dark mode, and `form-theme` media queries give buttons the correct height for Liquid Glass (macOS Tahoe) vs. classic rendering.

## Requirements

- 4D 21 or later (project uses `.4DProject` architecture; `compatibilityVersion: 2101`).
- 4D Write Pro (included with 4D).

## Origin

This project started as a binary `.4DB` example database originally distributed with 4D v16. It was converted to the modern project architecture (`.4DProject`) using 4D 21's built-in binary-to-project conversion tool, then modernised with the help of **GitHub Copilot**.

- **Blog post:** https://blog.4d.com/insert-pictures-4d-write-pro/
- **Original download:** https://download.4d.com/Demos/4D_v16/HDI_4DWP_InsertPicture.zip

## References

- [4D Write Pro documentation](https://developer.4d.com/docs/category/4d-write-pro)
- [4D CSS stylesheets](https://developer.4d.com/docs/FormEditor/stylesheets)
- [4D project architecture](https://developer.4d.com/docs/Project/architecture)
