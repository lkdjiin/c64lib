#import "./kernal.asm"

// Character output ----------------------------------------------------

.const VRAM = $0400

// Clear the screen.
//
// Destroys A.
.macro ClearScreen() {
  lda #147
  jsr CHROUT
}

// Colors --------------------------------------------------------------

.const COLOR_BACKGROUND = $d021
.const COLOR_CURRENT = $0286
.const COLOR_RAM = $d800 // Base address of the color RAM for text

.macro SetBlackBackground() {
  lda #BLACK
  sta COLOR_BACKGROUND
}

// SID - Audio ---------------------------------------------------------
.const SID_V3_FREQ_HI = $d40f
.const SID_V3_CONTROL = $d412
.const SID_VOLUME = $d418
.const SID_V3_WAVE_OUT = $d41b

// Sprites -------------------------------------------------------------
.const SPRITES_ENABLE = $d015
.const SPRITES_MULTICOLOR = $d01c
.const SPRITES_COLOR1 = $d025
.const SPRITES_COLOR2 = $d026
.const SPRITE0_X = $d000
.const SPRITE0_Y = $d001
.const SPRITE1_X = $d002
.const SPRITE1_Y = $d003
.const SPRITE2_X = $d004
.const SPRITE2_Y = $d005
.const SPRITE3_X = $d006
.const SPRITE3_Y = $d007
.const SPRITE4_X = $d008
.const SPRITE4_Y = $d009
.const SPRITE5_X = $d00a
.const SPRITE5_Y = $d00b
.const SPRITE6_X = $d00c
.const SPRITE6_Y = $d00d
.const SPRITE7_X = $d00e
.const SPRITE7_Y = $d00f
.const SPRITE0_COLOR = $d027
.const SPRITE1_COLOR = $d028
.const SPRITE2_COLOR = $d029
.const SPRITE3_COLOR = $d02a
.const SPRITE4_COLOR = $d02b
.const SPRITE5_COLOR = $d02c
.const SPRITE6_COLOR = $d02d
.const SPRITE7_COLOR = $d02e
.const SPRITE0_POINTER = $07f8
.const SPRITE1_POINTER = $07f9
.const SPRITE2_POINTER = $07fa
.const SPRITE3_POINTER = $07fb
.const SPRITE4_POINTER = $07fc
.const SPRITE5_POINTER = $07fd
.const SPRITE6_POINTER = $07fe
.const SPRITE7_POINTER = $07ff

.macro SetSpriteProperty(key, value)
{
  lda #value
  sta key
}
