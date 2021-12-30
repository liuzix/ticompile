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
	"github.com/pingcap/errors"
	"github.com/pingcap/log"
	"go.uber.org/zap"
)

type CompiledFunction = func(arg program.Arg) (program.Result, error)

func LLVMCompileIR(bitcode []byte) CompiledFunction {
	buf := C.CString(string(bitcode))
	defer C.free(unsafe.Pointer(buf))

	rawFuncPtr := uintptr(C.compileLLVMIR(buf, C.size_t(len(bitcode))))
	if rawFuncPtr == 0 {
		log.Panic("compileLLVMIR failed",
			zap.Binary("bitcode", bitcode))
	}

	return func(arg program.Arg) (program.Result, error) {
		result, err := CallTrampoline(rawFuncPtr, arg)
		if err != nil {
			return 0, errors.Trace(err)
		}
		return result, nil
	}
}
