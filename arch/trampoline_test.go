package arch

import (
	"testing"

	"github.com/liuzix/ticompile/program"
	"github.com/stretchr/testify/require"
)

// read only
var incFunction = []byte{
	// Note that this is the native calling convention
	0x48, 0x83, 0xC7, 0x01, // add rdi, 0x1
	0x48, 0x89, 0xF8, // mov rax, rdi
	0xC3, // ret
}

func TestCallTrampoline(t *testing.T) {
	targetFunc := program.NewMachineCode(incFunction)
	rawPtr, err := targetFunc.RawFuncPtr()
	require.NoError(t, err)

	result := CallWithArg(rawPtr, 2)
	require.NoError(t, err)
	require.Equal(t, uintptr(3), result)
}

func BenchmarkCallTrampoline(b *testing.B) {
	targetFunc := program.NewMachineCode(incFunction)
	rawPtr, err := targetFunc.RawFuncPtr()
	if err != nil {
		b.FailNow()
	}
	b.ResetTimer()

	for i := 0; i < b.N; i++ {
		result := CallWithArg(rawPtr, 2)
		if result != 3 {
			b.FailNow()
		}
	}
}