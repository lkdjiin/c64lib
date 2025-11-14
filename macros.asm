// Clear the screen.
//
// Destroys A.
.macro ClearScreen() {
  lda #147
  jsr CHROUT
}
