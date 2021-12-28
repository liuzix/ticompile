package program

import (
	"testing"

	"github.com/stretchr/testify/require"
)

// read only
var incFunction = []byte{
	0x48, 0x83, 0xC0, 0x01, // add rax,0x1
	0xC3, // ret
}

func TestMachineCodeIncFunc(t *testing.T) {
	code := NewMachineCode(incFunction)
	defer func() {
		err := code.Release()
		require.NoError(t, err)
	}()

	for i := 0; i < 5; i++ {
		// Run multiple times
		result, err := code.Execute(5, 0)
		require.NoError(t, err)
		require.Equal(t, Result(6), result)
	}
}

// read only
var addFunction = []byte{
	0x48, 0x01, 0xD8, // add rax, rbx
	0xC3, // ret
}

func TestMachineCodeAddFunc(t *testing.T) {
	code := NewMachineCode(addFunction)
	defer func() {
		err := code.Release()
		require.NoError(t, err)
	}()

	for i := 0; i < 5; i++ {
		// Run multiple times
		result, err := code.Execute(5, 6)
		require.NoError(t, err)
		require.Equal(t, Result(11), result)
	}
}
