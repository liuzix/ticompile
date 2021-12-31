package gen

import (
	"testing"

	"github.com/liuzix/ticompile/compile"
	"github.com/llir/llvm/ir/constant"
	irTypes "github.com/llir/llvm/ir/types"
	"github.com/pingcap/log"
	"github.com/stretchr/testify/require"
	"go.uber.org/zap"
)

func TestGenLoop(t *testing.T) {
	ctx := NewCodeGenContext("")
	loc := ctx.Block().NewAlloca(irTypes.I64)
	ctx.Block().NewStore(constant.NewInt(irTypes.I64, 0), loc)
	limit := constant.NewInt(irTypes.I64, 101)

	loopCtx := ctx.Loop(limit)
	oldVal := loopCtx.Block().NewLoad(irTypes.I64, loc)
	newVal := loopCtx.Block().NewAdd(oldVal, loopCtx.LoopVar())
	loopCtx.Block().NewStore(newVal, loc)
	loopCtx.FinishLoop()

	val := ctx.Block().NewLoad(irTypes.I64, loc)
	ctx.Block().NewRet(val)

	asm := ctx.Module().String()
	log.Info("TestGenLoop: generated IR",
		zap.String("ir", asm))

	fn := compile.LLVMCompileIR([]byte(asm))
	res, err := fn(0)
	require.NoError(t, err)
	require.Equal(t, uintptr(5050), res)
}
