package gen

import (
	"github.com/llir/llvm/ir/constant"
	irTypes "github.com/llir/llvm/ir/types"
	"github.com/llir/llvm/ir/value"
)

type ColumnWriter struct {
	columnPointer value.Value
}

// NewColumnWriter returns a new ColumnWriter.
// TODO be compatible with variable sized columns.
func NewColumnWriter(ctx CodeGenContext) *ColumnWriter {
	idxConst := constant.NewInt(irTypes.I64, 0)
	colPtrPtr := ctx.Block().NewGetElementPtr(columnPointerType, ctx.Param(), idxConst)
	colPtr := ctx.Block().NewLoad(columnPointerType, colPtrPtr)

	return &ColumnWriter{
		columnPointer: colPtr,
	}
}

func (w *ColumnWriter) PutInt64(ctx CodeGenContext, rowIdx value.Value, val value.Value) {
	addr := ctx.Block().NewGetElementPtr(irTypes.I64, w.columnPointer, rowIdx)
	ctx.Block().NewStore(val, addr)
}
