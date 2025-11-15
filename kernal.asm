#if !C64LIB_KERNAL_ASM
#define C64LIB_KERNAL_ASM

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

// Checks the RUN/STOP key
.const STOP = $ffe1

#endif // !C64LIB_KERNAL_ASM
