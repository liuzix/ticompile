package gen

import (
	"github.com/llir/llvm/ir/constant"
	irTypes "github.com/llir/llvm/ir/types"
	"github.com/llir/llvm/ir/value"
	tidbTypes "github.com/pingcap/tidb/types"
)

type ChunkReader struct {
	columnPointers []value.Value
}

var columnPointerType = irTypes.NewPointer(irTypes.I64)

func NewChunkReader(ctx *BaseCodeGenContext, types []*tidbTypes.FieldType) *ChunkReader {
	numColumns := len(types)
	colPtrs := make([]value.Value, numColumns)
	for idx := 0; idx < numColumns; idx++ {
		idxConst := constant.NewInt(irTypes.I64, int64(idx+1))
		colPtrPtr := ctx.Block().NewGetElementPtr(columnPointerType, ctx.Param(), idxConst)
		colPtr := ctx.Block().NewLoad(columnPointerType, colPtrPtr)
		colPtrs[idx] = colPtr
	}

	return &ChunkReader{
		columnPointers: colPtrs,
	}
}

func (r *ChunkReader) ReadInt64(ctx *BaseCodeGenContext, colID int, rowID value.Value) value.Value {
	column := r.columnPointers[colID]
	addr := ctx.Block().NewGetElementPtr(irTypes.I64, column, rowID)
	ret := ctx.Block().NewLoad(irTypes.I64, addr)
	return ret
}
