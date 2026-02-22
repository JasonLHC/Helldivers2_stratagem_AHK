# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Single-file AutoHotkey v2 script (`helldiver.ahk`) that maps Numpad keys to stratagem directional sequences in Helldivers 2.

## Running

- Requires [AutoHotkey v2](https://www.autohotkey.com/) installed on Windows
- Double-click `helldiver.ahk` to launch; right-click the tray icon to reload after edits
- **F12** suspends/resumes the script
- Hotkeys are scoped to `helldivers2.exe` via `#HotIf WinActive(...)` — they do nothing outside the game

## Architecture

Everything lives in `helldiver.ahk`:

- **`SetKeyDelay(100, 100)`** — global delay added between keystrokes to ensure the game registers inputs reliably
- **`#HotIf WinActive("ahk_exe helldivers2.exe")`** — context guard; all hotkeys below it only fire when the game window is active
- **Numpad bindings** — each maps to a `CallStratagem("...")` call with a direction string
- **`CallStratagem(code)`** — holds LCtrl (the in-game stratagem modifier), then sends each direction character as a scancode key press/release with 60 ms gaps, then releases LCtrl

## Stratagem Code Format

Direction strings use `U` (up), `D` (down), `L` (left), `R` (right). Arrow key scancodes:

| Direction | Scancode |
|-----------|----------|
| U         | SC148    |
| D         | SC150    |
| L         | SC14B    |
| R         | SC14D    |

Scancodes are used instead of virtual keys to bypass game input filtering.

## Adding a New Stratagem

Add a line inside the `#HotIf` block:

```ahk
NumpadX:: CallStratagem("SEQUENCE")  ; Stratagem Name
```

Replace `NumpadX` with the desired key and `SEQUENCE` with the U/D/L/R pattern from the in-game stratagem list.
