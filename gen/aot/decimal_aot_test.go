package aot

import (
	"testing"

	"github.com/stretchr/testify/require"
)

func TestDecimalAotModuleLoaded(t *testing.T) {
	require.NotNil(t, DecimalModule)
}

func TestDecimalMulFunctionFound(t *testing.T) {
	require.Equal(t, decimalMulFuncName, DecimalMulFunction.Name())
	require.Equal(t, decimalSubFuncName, DecimalSubFunction.Name())
}
