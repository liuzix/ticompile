package program

import (
	"syscall"
	"unsafe"

	"github.com/pingcap/errors"
	"github.com/pingcap/log"
)

type (
	// Args is the type for arguments to the function.
	// We support one int value for now.
	Args = int

	// Result is the type for return values.
	Result = int

	Callable = func(Args) Result
)

type MachineCode struct {
	Code []byte

	// funcPtr is a pointer to executable code in memory
	funcPtr []byte
}

func NewMachineCode(code []byte) *MachineCode {
	return &MachineCode{
		Code: code,
	}
}

func (m *MachineCode) mmap() error {
	if len(m.Code) == 0 {
		log.Panic("code is empty")
	}

	funcPtr, err := syscall.Mmap(
		-1,
		0,
		len(m.Code),
		syscall.PROT_READ|syscall.PROT_WRITE|syscall.PROT_EXEC, syscall.MAP_PRIVATE|syscall.MAP_ANONYMOUS,
	)
	if err != nil {
		return errors.Trace(err)
	}

	// Copies the code to an executable memory block
	copy(funcPtr, m.Code)

	m.funcPtr = funcPtr
	return nil
}

func (m *MachineCode) Execute(args Args) (Result, error) {
	if m.funcPtr == nil {
		if err := m.mmap(); err != nil {
			return 0, errors.Trace(err)
		}
	}

	unsafeFunc := (uintptr)(unsafe.Pointer(&m.funcPtr))
	executablePtr := *(*Callable)(unsafe.Pointer(&unsafeFunc))
	ret := executablePtr(args)

	return ret, nil
}
