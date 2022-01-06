package aot

import (
	_ "embed"

	"github.com/llir/llvm/asm"
	"github.com/llir/llvm/ir"
	irTypes "github.com/llir/llvm/ir/types"
	"github.com/pingcap/log"
	"go.uber.org/zap"
)

//go:embed decimal.ll
var decimalIRCode []byte

var (
	DecimalModule *ir.Module
	DecimalType = irTypes.NewStruct(irTypes.I8, irTypes.I8, irTypes.I8, irTypes.I1, irTypes.NewArray(9, irTypes.I32))
	DecimalMulFunction *ir.Func
)

const (
	decimalMulFuncName = "main.DecimalMul"
)


func init() {
	var err error
	DecimalModule, err = asm.ParseBytes("", decimalIRCode)
	if err != nil {
		log.Panic("failed to parse LLVM file decimal.ll")
	}

	DecimalMulFunction = findDecimalMulFunction()
}

func findDecimalMulFunction() *ir.Func {
	for _, fn := range DecimalModule.Funcs {
		if fn.Name() == decimalMulFuncName {
			return fn
		}
	}
	log.Panic(
		"function not found",
		zap.String("func-name", decimalMulFuncName))
	panic("unreachable")
}