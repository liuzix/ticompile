package program

import (
	"testing"

	"github.com/stretchr/testify/require"
)

// read only
var addFunctionSystemABI = []byte{
	0x48, 0x83, 0xC7, 0x01, // add rdi,0x1
	0x48, 0x89, 0xF8, // mov rax,rdi
	0xC3, // ret
}

func TestAMD64ConvertToGoABI(t *testing.T) {
	code := NewMachineCode(addFunctionSystemABI)
	defer func() {
		err := code.Release()
		require.NoError(t, err)
	}()

	abi := NewAMD64PlatformABI()
	err := abi.ConvertToGoABI(code)
	require.NoError(t, err)

	result, err := code.Execute(10)
	require.NoError(t, err)
	require.Equal(t, 11, result)
}
