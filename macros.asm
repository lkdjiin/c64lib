#import "./kernal.asm"

// Constants to sort later ----------------------------------------------
.const JIFFY_LOW = $a2
.const SCREEN_CONTROL_2 = $d016
.const MEMORY_SETUP = $d018
.const EXTRA_COLOR_1 = $d022
.const EXTRA_COLOR_2 = $d023
.const BORDER = $d020

// Character output ----------------------------------------------------

.const VRAM = $0400
.const SCREEN_CONTROL = $d011

// Clear the screen.
//
// Destroys A.
.macro ClearScreen() {
  lda #147
  jsr CHROUT
}

// Print a 16 bits integer at cursor location.
//
// address - Address of the 16 bits integer.
//
// Destroys A, X.
.macro PrintWord(address) {
  ldx address
  lda address + 1
  jsr LINPRT
}

// Move the cursor to a new position.
//
// col - 0 to 39
// row - 0 to 24
//
// Destroys X, Y.
.macro SetCursorPosition(col, row) {
  ldx #row
  ldy #col
  clc
  jsr PLOT
}

// Colors --------------------------------------------------------------

.const COLOR_BACKGROUND = $d021
.const COLOR_CURRENT = $0286
.const COLOR_RAM = $d800 // Base address of the color RAM for text

.macro SetBlackBackground() {
  lda #BLACK
  sta COLOR_BACKGROUND
}

// Input/output ports --------------------------------------------------
.const JOYSTICK_2 = $dc00
.const JOYSTICK_1 = $dc01

// Is joystick 1 fire pressed?
// Set zero flag if joystick's fire button is pressed.
//
// Destroys A.
.macro Joystick_1_fire() {
  lda JOYSTICK_1
  and #%00010000
}

// Is joystick 2 fire pressed?
// Set zero flag if joystick's fire button is pressed.
//
// Destroys A.
.macro Joystick_2_fire() {
  lda JOYSTICK_2
  and #%00010000
}

// Interrupt -----------------------------------------------------------

.const SYSTEM_IRQ_HANDLER = $ea31
.const INTERRUPT_CONTROL_AND_STATUS = $dc0d
.const INTERRUPT_STATUS = $d019
.const INTERRUPT_CONTROL = $d01a
.const RASTER_LINE = $d012 // Bits #0 to #7. There is a bit #8 into SCREEN_CONTROL
.const INTERRUPT_SERVICE_ROUTINE_ADDRESS = $0314 // Low byte. High byte is at $0315

// SID - Audio ---------------------------------------------------------
.const SID_V3_FREQ_HI = $d40f
.const SID_V3_CONTROL = $d412
.const SID_VOLUME = $d418
.const SID_V3_WAVE_OUT = $d41b
.const SID_V1_FREQUENCY_LOW = $d400
.const SID_V1_FREQUENCY_HIGH = $d401
.const SID_V1_CONTROL = $d404
.const SID_V1_ATTACK_DECAY = $d405
.const SID_V1_SUSTAIN_RELEASE = $d406

// Sprites -------------------------------------------------------------
.const SPRITES_ENABLE = $d015
.const SPRITES_MULTICOLOR = $d01c
.const SPRITES_EXTRA_COLOR_1 = $d025
.const SPRITES_EXTRA_COLOR_2 = $d026
.const SPRITE_0_X = $d000
.const SPRITE_0_Y = $d001
.const SPRITE_1_X = $d002
.const SPRITE_1_Y = $d003
.const SPRITE_2_X = $d004
.const SPRITE_2_Y = $d005
.const SPRITE_3_X = $d006
.const SPRITE_3_Y = $d007
.const SPRITE_4_X = $d008
.const SPRITE_4_Y = $d009
.const SPRITE_5_X = $d00a
.const SPRITE_5_Y = $d00b
.const SPRITE_6_X = $d00c
.const SPRITE_6_Y = $d00d
.const SPRITE_7_X = $d00e
.const SPRITE_7_Y = $d00f
.const SPRITE_0_COLOR = $d027
.const SPRITE_1_COLOR = $d028
.const SPRITE_2_COLOR = $d029
.const SPRITE_3_COLOR = $d02a
.const SPRITE_4_COLOR = $d02b
.const SPRITE_5_COLOR = $d02c
.const SPRITE_6_COLOR = $d02d
.const SPRITE_7_COLOR = $d02e
.const SPRITE_0_POINTER = $07f8
.const SPRITE_1_POINTER = $07f9
.const SPRITE_2_POINTER = $07fa
.const SPRITE_3_POINTER = $07fb
.const SPRITE_4_POINTER = $07fc
.const SPRITE_5_POINTER = $07fd
.const SPRITE_6_POINTER = $07fe
.const SPRITE_7_POINTER = $07ff

.macro SetSpriteProperty(key, value)
{
  lda #value
  sta key
}
