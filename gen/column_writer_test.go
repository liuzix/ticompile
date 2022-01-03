package gen

import (
	"testing"
	"unsafe"

	"github.com/liuzix/ticompile/compile"
	"github.com/llir/llvm/ir/constant"
	irTypes "github.com/llir/llvm/ir/types"
	"github.com/pingcap/log"
	"github.com/pingcap/tidb/parser/mysql"
	tidbTypes "github.com/pingcap/tidb/types"
	"github.com/pingcap/tidb/util/chunk"
	"github.com/stretchr/testify/require"
	"go.uber.org/zap"
)

func newColumnForTest(fieldType *tidbTypes.FieldType, capacity int) *chunk.Column {
	return chunk.NewColumn(fieldType, capacity)
}

func TestColumnWriterPutInt64(t *testing.T) {
	elemType := tidbTypes.NewFieldType(mysql.TypeLonglong)

	col := newColumnForTest(elemType, 1024)
	require.Equal(t, 0, len(col.Int64s()))

	ctx := NewCodeGenContext("")
	writer := NewColumnWriter(ctx)
	for i := 0; i < 1024; i++ {
		writer.PutInt64(ctx,
			constant.NewInt(irTypes.I64, int64(i)),
			constant.NewInt(irTypes.I64, int64(i+1)))
	}
	ctx.Block().NewRet(constant.NewInt(irTypes.I64, 0)) // dummy return

	asm := ctx.Module().String()
	log.Info("generate IR", zap.String("asm", asm))

	col.ResizeInt64(1024, true)
	inputVec := []uintptr{
		0, // limit
		uintptr(unsafe.Pointer(&col.Int64s()[0])),
	}
	inputParam := uintptr(unsafe.Pointer(&inputVec[0]))
	fn := compile.LLVMCompileIR([]byte(asm))

	res, err := fn(inputParam)
	require.NoError(t, err)
	require.Equal(t, uintptr(0), res)

	for i := 0; i < 1024; i++ {
		val := col.GetInt64(i)
		require.Equal(t, int64(i+1), val)
	}
}
