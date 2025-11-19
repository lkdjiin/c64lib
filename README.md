# c64lib

Assembly library for the Commodore 64 (KickAssembler format).

## Kernal

In "kernal.asm". Can also contain routines from BASIC ROM.

## Macros

Macros that don't pertain to a specific routine.
Includes also all needed constants and kernal.

In "macros.asm"

- **ClearScreen()**
- **PrintWord(address)**
- **SetBlackBackground()**
- **SetCursorPosition(col, row)**
- **SetSpriteProperty(key, value)**

## Routines

A routine file can also include related macros.

### Color

- **fill_text_color** "fill_text_color.asm"
  - FillTextColor(color)
- **set_text_color** "set_text_color.asm"
  - SetYellowText()

### Random number

- **rnd.init** "rnd.asm"
- **rnd.range** "rnd.asm"
  - RandomRange(lo, hi)
