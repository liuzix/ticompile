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
	DecimalType irTypes.Type
	DecimalMulFunction *ir.Func
)

const (
	decimalMulFuncName = "DecimalMul"
	decimalType = "MyDecimal"
)

func init() {
	var err error
	DecimalModule, err = asm.ParseBytes("", decimalIRCode)
	if err != nil {
		log.Panic("failed to parse LLVM file decimal.ll", zap.Error(err))
	}
	DecimalMulFunction = findDecimalMulFunction()
	DecimalType = findDecimalType()

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

func findDecimalType() irTypes.Type {
	for _, tp := range DecimalModule.TypeDefs {
		if tp.Name() == decimalType {
			return tp
		}
	}
	log.Panic(
		"function not found",
		zap.String("func-name", decimalType))
	panic("unreachable")
}