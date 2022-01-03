package gen

import (
	"testing"
	"unsafe"

	"github.com/liuzix/ticompile/compile"
	"github.com/llir/llvm/ir/constant"
	irTypes "github.com/llir/llvm/ir/types"
	"github.com/pingcap/log"
	"github.com/pingcap/tidb/parser/mysql"
	"github.com/pingcap/tidb/types"
	"github.com/pingcap/tidb/util/chunk"
	"github.com/stretchr/testify/require"
	"go.uber.org/zap"
)

func TestReadInt64FromChunk(t *testing.T) {
	chunkTypes := []*types.FieldType{types.NewFieldType(mysql.TypeLonglong)}
	inputChunk := chunk.New(chunkTypes, 1024, 1024)
	for i := 0; i < 100; i++ {
		inputChunk.AppendInt64(0, int64(i))
	}

	codeGenCtx := NewCodeGenContext("")
	chunkReader := NewChunkReader()

	val := chunkReader.ReadInt64(codeGenCtx, 0, constant.NewInt(irTypes.I64, 50))
	codeGenCtx.Block().NewRet(val)

	asmText := codeGenCtx.Module().String()
	log.Info("compiled IR", zap.String("asm", asmText))

	fn := compile.LLVMCompileIR([]byte(asmText))

	inputVec := []uintptr{
		0,
		0,
		uintptr(unsafe.Pointer(&inputChunk.Column(0).Int64s()[0])),
	}
	inputParam := uintptr(unsafe.Pointer(&inputVec[0]))
	log.Info("input", zap.Uintptr("ptr", inputParam))
	res, err := fn(inputParam)
	require.NoError(t, err)
	require.Equal(t, uintptr(50), res)
}
