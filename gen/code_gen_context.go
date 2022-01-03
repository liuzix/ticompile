package gen

import (
	"github.com/llir/llvm/ir"
	"github.com/llir/llvm/ir/constant"
	"github.com/llir/llvm/ir/enum"
	"github.com/llir/llvm/ir/types"
	"github.com/llir/llvm/ir/value"
)

const (
	jitMainFuncName = "jit_main"
)

type CodeGenContext interface {
	Module() *ir.Module
	Block() *ir.Block
	SetBlock(block *ir.Block)
	Param() value.Value
	Loop(limit value.Value) *LoopCodeGenContext
	RelocateInputIdx(placeholder string) (idx int)
	InputReader() *ChunkReader
	OutputWriter() *ColumnWriter
}

type BaseCodeGenContext struct {
	module       *ir.Module
	MainFunc     *ir.Func
	block        *ir.Block
	param        value.Value
	inputReader  *ChunkReader
	outputWriter *ColumnWriter

	InputIdxMap map[string]int
}

func NewCodeGenContext(blockName string) *BaseCodeGenContext {
	module := ir.NewModule()

	inputPointerVecType := types.NewPointer(types.I64)
	inputParam := ir.NewParam("jit_input", types.NewPointer(inputPointerVecType))
	mainFunc := module.NewFunc(
		jitMainFuncName,
		types.I64,
		inputParam)
	block := mainFunc.NewBlock(blockName)

	ret := &BaseCodeGenContext{
		module:   module,
		MainFunc: mainFunc,
		block:    block,
		param:    inputParam,
	}
	return ret
}

func NewCodeGenContextWithChunkReader() *BaseCodeGenContext {
	ctx := NewCodeGenContext("")
	chunkReader := NewChunkReader()
	ctx.inputReader = chunkReader

	columnWriter := NewColumnWriter(ctx)
	ctx.outputWriter = columnWriter
	return ctx
}

func (c *BaseCodeGenContext) Module() *ir.Module {
	return c.module
}

func (c *BaseCodeGenContext) Block() *ir.Block {
	return c.block
}

func (c *BaseCodeGenContext) SetBlock(block *ir.Block) {
	c.block = block
}

func (c *BaseCodeGenContext) Param() value.Value {
	return c.param
}

func (c *BaseCodeGenContext) RelocateInputIdx(placeholder string) (idx int) {
	if index, ok := c.InputIdxMap[placeholder]; ok {
		return index
	}
	return -1
}

func (c *BaseCodeGenContext) InputReader() *ChunkReader {
	return c.inputReader
}

func (c *BaseCodeGenContext) OutputWriter() *ColumnWriter {
	return c.outputWriter
}

type LoopCodeGenContext struct {
	CodeGenContext

	loopBlock       *ir.Block
	loopCounter     value.Value
	nextLoopCounter value.Value
	loopLimit       value.Value
}

// Loop returns a context that can be used in a loop.
// ref: https://llvm.org/docs/tutorial/MyFirstLanguageFrontend/LangImpl05.html#llvm-ir-for-the-for-loop
func (c *BaseCodeGenContext) Loop(limit value.Value) *LoopCodeGenContext {
	loopBlock := c.MainFunc.NewBlock("")
	afterLoopBlock := c.MainFunc.NewBlock("")

	c.Block().NewBr(loopBlock)
	preLoopBlock := c.Block()
	c.SetBlock(afterLoopBlock)

	loopCtx := &LoopCodeGenContext{
		CodeGenContext: c,
		loopBlock:      loopBlock,
	}

	initLoopVar := constant.NewInt(types.I64, 0)
	phiNode := loopBlock.NewPhi(
		ir.NewIncoming(initLoopVar, preLoopBlock))
	loopCtx.loopCounter = phiNode
	loopVarIncConst := constant.NewInt(types.I64, 1)
	loopCtx.nextLoopCounter = loopBlock.NewAdd(loopCtx.loopCounter, loopVarIncConst)
	phiNode.Incs = append(phiNode.Incs, ir.NewIncoming(loopCtx.nextLoopCounter, loopBlock))
	loopCtx.loopLimit = limit

	return loopCtx
}

func (c *LoopCodeGenContext) Block() *ir.Block {
	return c.loopBlock
}

func (c *LoopCodeGenContext) LoopVar() value.Value {
	return c.loopCounter
}

func (c *LoopCodeGenContext) FinishLoop() {
	cond := c.loopBlock.NewICmp(enum.IPredEQ, c.nextLoopCounter, c.loopLimit)
	c.loopBlock.NewCondBr(cond, c.CodeGenContext.Block(), c.loopBlock)
}
