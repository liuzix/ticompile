package compile

/*
#include <stddef.h>
#include <stdlib.h>
#cgo LDFLAGS: -L${SRCDIR}/../cpp -lllvm_bridge -Wl,-rpath=${SRCDIR}/../cpp
void* compileLLVMIR(const char* ir, size_t len);
*/
import "C"

import (
	"unsafe"

	"github.com/liuzix/ticompile/program"
)

func CompileBitcode(bitcode []byte) *program.MachineCode {
	buf := C.CString(string(bitcode))
	defer C.free(unsafe.Pointer(buf))
	_ = C.compileLLVMIR(buf, C.size_t(len(bitcode)))

	return nil
}
