package gen

import (
	"github.com/liuzix/ticompile/gen/aot"
	"github.com/llir/llvm/ir/constant"
	irTypes "github.com/llir/llvm/ir/types"
	"github.com/llir/llvm/ir/value"
)

type ChunkReader struct{}

var columnPointerType = irTypes.NewPointer(irTypes.I64)

func NewChunkReader() *ChunkReader {
	return &ChunkReader{}
}

const (
	inputLimitIdx     = 0
	inputColIdxOffset = 2
)

func (r *ChunkReader) GetLimit(ctx CodeGenContext) value.Value {
	idxConst := constant.NewInt(irTypes.I64, int64(inputLimitIdx))
	limitPtr := ctx.Block().NewGetElementPtr(irTypes.NewPointer(irTypes.I64), ctx.Param(), idxConst)
	limit := ctx.Block().NewLoad(irTypes.NewPointer(irTypes.I64), limitPtr)
	realLimit := ctx.Block().NewPtrToInt(limit, irTypes.I64)
	return realLimit
}

func (r *ChunkReader) ReadInt64(ctx CodeGenContext, colID int, rowID value.Value) value.Value {
	idxConst := constant.NewInt(irTypes.I64, int64(colID+inputColIdxOffset))
	colPtrPtr := ctx.Block().NewGetElementPtr(columnPointerType, ctx.Param(), idxConst)
	colPtr := ctx.Block().NewLoad(columnPointerType, colPtrPtr)

	addr := ctx.Block().NewGetElementPtr(irTypes.I64, colPtr, rowID)
	ret := ctx.Block().NewLoad(irTypes.I64, addr)
	return ret
}

func (r *ChunkReader) ReadDecimal(ctx CodeGenContext, colID int, rowID value.Value) value.Value {
	idxConst := constant.NewInt(irTypes.I64, int64(colID+inputColIdxOffset))
	colPtrPtr := ctx.Block().NewGetElementPtr(columnPointerType, ctx.Param(), idxConst)
	colPtr := ctx.Block().NewLoad(columnPointerType, colPtrPtr)
	decimalPtr := ctx.Block().NewBitCast(colPtr, irTypes.NewPointer(aot.DecimalType))

	addr := ctx.Block().NewGetElementPtr(aot.DecimalType, decimalPtr, rowID)
	return addr
}
