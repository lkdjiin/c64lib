// Fill text screen color RAM with a single color.
//
// A - The color code.
//
// Destroys Y.
fill_text_color: {
  ldy #250
  loop:
    dey
    sta COLOR_RAM,y       // 1st quarter
    sta COLOR_RAM + 250,y // 2nd quarter
    sta COLOR_RAM + 500,y // 3rd quarter
    sta COLOR_RAM + 750,y // 4th quarter
    bne loop              // All 250 bytes?
  rts
}

.macro FillTextColor(color) {
  lda #color
  jsr fill_text_color
}
