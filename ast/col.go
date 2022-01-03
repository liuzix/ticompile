package ast

import (
	"github.com/liuzix/ticompile/gen"
	irTypes "github.com/llir/llvm/ir/types"
	"github.com/llir/llvm/ir/value"
	"github.com/pingcap/log"
	"github.com/pingcap/tidb/types"
	"go.uber.org/zap"
)

type ColNode struct {
	colIdx            *int
	colIdxPlaceholder string
	tp                irTypes.Type
}

func NewColNodeWithIdx(colIdx int, tp types.EvalType) *ColNode {
	return &ColNode{
		colIdx: &colIdx,
		tp:     IRTypeFromEvalType(tp),
	}
}

func NewColNodeWithPlaceholder(placeholder string, tp types.EvalType) *ColNode {
	return &ColNode{
		colIdxPlaceholder: placeholder,
		tp:                IRTypeFromEvalType(tp),
	}
}

func (c *ColNode) Compile(ctx gen.CodeGenContext) value.Value {
	var colIdx int
	if c.colIdx != nil {
		colIdx = *c.colIdx
	} else {
		colIdx = ctx.RelocateInputIdx(c.colIdxPlaceholder)
	}

	loopCtx, ok := ctx.(*gen.LoopCodeGenContext)
	if !ok {
		log.Panic("must be compiled within a loop",
			zap.Any("col-idx", c.colIdx),
			zap.String("col-idx-placeholder", c.colIdxPlaceholder),
			zap.Any("tp", c.tp))
	}

	// TODO support other data types
	return ctx.InputReader().ReadInt64(ctx, colIdx, loopCtx.LoopVar())
}

func (c *ColNode) GetIRType() (irTypes.Type, error) {
	return c.tp, nil
}
