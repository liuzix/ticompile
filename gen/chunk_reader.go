package gen

import (
	"github.com/llir/llvm/ir/constant"
	"github.com/llir/llvm/ir/types"
	"github.com/llir/llvm/ir/value"
)

func ReadInt64FromChunk(ctx *CodeGenContext, colID int, rowID value.Value) value.Value {
	column := ctx.InputColumns[colID]
	baseAddr := ctx.Block.NewPtrToInt(column, types.I64)
	offset := ctx.Block.NewMul(rowID, constant.NewInt(types.I64, 8))
	loadAddr := ctx.Block.NewAdd(baseAddr, offset)
	ptr := ctx.Block.NewIntToPtr(loadAddr, types.I64)
	ret := ctx.Block.NewLoad(types.I64, ptr)
	return ret
}