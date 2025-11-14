.macro RandomRange(low, high) {
  lda #high-low
  jsr rnd.range
  clc
  adc #low
}

rnd: {

  // Routine to initialize SID voice 3 for random numbers.
  //
  // Destroys A.
  //
  init:
    lda #$ff     // Set voice 3 frequency (high byte) to maximum
    sta SID_V3_FREQ_HI
    lda #%10000000
    sta SID_V3_CONTROL   // Select noise waveform and start release for voice 3
    sta SID_VOLUME   // Turn off volume and disconnect output of voice 3
    rts

  // Returns a random byte from 0 to upper limit.
  // A - upper limit (excluded)
  //
  // Returns result in A.
  //
  range: {
    sta upper_limit
    r2:
      lda SID_V3_WAVE_OUT   // Get single byte random number
      cmp upper_limit       // Upper limit of range
      bcs r2
    jmp done
    upper_limit: .byte 0
    done:
      rts
  }
}
