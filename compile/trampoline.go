package compile

/*
#include <stdint.h>

uint64_t CallCGOTrampoline(uint64_t ptr, uint64_t arg) {
	uint64_t (*fn)(uint64_t) = (uint64_t (*)(uint64_t))ptr;
	return fn(arg);
}
 */
import "C"

import (
	"github.com/pingcap/log"
	"go.uber.org/zap"
	"runtime"

	"github.com/liuzix/ticompile/program"
)

var trampoline = buildTrampoline()

func CallCGOTrampoline(ptr, arg uintptr) uintptr{
	log.Info("trampoline called", zap.Stack("stack"))
	return uintptr(C.CallCGOTrampoline(C.ulong(ptr), C.ulong(arg)))
}

//go:nosplit
func CallTrampoline(ptr, arg program.Arg) (program.Result, error) {
	runtime.LockOSThread()
	ret, err := trampoline.Execute(ptr, arg)
	runtime.UnlockOSThread()
	if err != nil {
		return 0, err
	}
	return ret, nil
}

func buildTrampoline() *program.MachineCode {
	asm := []byte{
		0x48, 0x89, 0xDF, // mov rdi, rbx
		0xFF, 0xD0, // call rax
		0xC3, // ret
	}
	return program.NewMachineCode(asm)
}
