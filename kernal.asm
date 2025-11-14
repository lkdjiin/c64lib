#if !C64LIB_KERNAL_ASM
#define C64LIB_KERNAL_ASM

// Print a character at cursor position.
//
// A - The PETSCII character to print.
//
// Destroys nothing.
.const CHROUT = $ffd2

// Retrieves a single character.
//
// Returns the PETSCII character in A. This is non-blocking, if no character
// then A will contain 0.
//
// Destroys A, X.
.const GETIN = $ffe4

#endif // !C64LIB_KERNAL_ASM
