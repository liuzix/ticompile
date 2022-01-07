// +build go1.17,!go1.18


#include "go_asm.h"
#include "funcdata.h"
#include "textflag.h"

// func CallWithArg(funcPtr, arg) uintptr
TEXT ·CallWithArg(SB), NOSPLIT, $0-4096

MOVQ first_arg+0(FP), AX
MOVQ second_arg+8(FP), DI
CALL AX
MOVQ AX, ret+0x10(FP)
RET
