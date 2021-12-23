package program

import (
	"testing"

	"github.com/stretchr/testify/require"
)

// read only
var addFunction = []byte{
	0x48, 0x83, 0xC0, 0x01, // add rax,0x1
	0xC3, // ret
}

func TestMachineCodeAddFunc(t *testing.T) {
	code := NewMachineCode(addFunction)
	result, err := code.Execute(5)
	require.NoError(t, err)
	require.Equal(t, 6, result)
}
