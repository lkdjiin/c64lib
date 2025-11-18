#if !C64LIB_KERNAL_ASM
#define C64LIB_KERNAL_ASM

// Print a 16 bits integer at cursor position.
// It's a routine from the BASIC ROM.
//
// X - Low byte
// A - High byte
.const LINPRT = $bdcd

// Outputs an ASCII character at cursor position.
//
// A - The character to print.
//
// Destroys nothing.
.const CHROUT = $ffd2

// Gets an ASCII character
//
// Returns the PETSCII character in A. This is non-blocking, if no character
// then A will contain 0.
//
// Destroys A, X.
.const GETIN = $ffe4

// Checks the RUN/STOP key.If RUN/STOP is being pressed at that instant,
// the Z flag will be set when the subroutine returns.
.const STOP = $ffe1

// Set the cursor location.
//
// Be sure to clear the carry flag before calling this routine, otherwise
// it will not work.
// X - The cursor row (0 to 24)
// Y - The cursor column (0 to 39)
.const PLOT = $fff0

#endif // !C64LIB_KERNAL_ASM
