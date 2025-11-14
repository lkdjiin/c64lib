#import "./kernal.asm"

// Character output ----------------------------------------------------

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
