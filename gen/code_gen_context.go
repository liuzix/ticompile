package gen

import (
	"github.com/llir/llvm/ir"
	"github.com/llir/llvm/ir/types"
	"github.com/llir/llvm/ir/value"
)

const (
	jitMainFuncName = "jit_main"
)

type CodeGenContext struct {
	Module       *ir.Module
	MainFunc     *ir.Func
	Block        *ir.Block
	InputColumns []value.Value
}

func NewCodeGenContext(blockName string, numColumns int) *CodeGenContext {
	module := ir.NewModule()
	mainFunc := ir.NewFunc(
		jitMainFuncName,
		types.I64,
		ir.NewParam("jit_input", types.NewVector(uint64(numColumns+1), types.I64)))
	block := ir.NewBlock(blockName)

	inputColumns := make([]value.Value, numColumns)
	for idx := 0; idx < numColumns; idx++ {
		colPtr := 
	}

	return &CodeGenContext{
		Module: module,
		MainFunc: mainFunc,
		Block: block,
	}
}
