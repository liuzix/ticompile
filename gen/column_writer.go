package gen

import (
	"github.com/liuzix/ticompile/gen/aot"
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
	idxConst := constant.NewInt(irTypes.I64, 1)
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

func (w *ColumnWriter) PutDecimal(ctx CodeGenContext, rowIdx value.Value, val value.Value) {
	ptr := ctx.Block().NewBitCast(w.columnPointer, irTypes.NewPointer(aot.DecimalType))
	addr := ctx.Block().NewGetElementPtr(aot.DecimalType, ptr, rowIdx)
	decVal := ctx.Block().NewLoad(aot.DecimalType, val)
	ctx.Block().NewStore(decVal, addr)
}
