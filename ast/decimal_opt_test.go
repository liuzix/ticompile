package ast

import (
	"runtime"
	"testing"
	"unsafe"

	"github.com/liuzix/ticompile/compile"
	"github.com/liuzix/ticompile/gen"
	"github.com/liuzix/ticompile/gen/aot"
	"github.com/llir/llvm/ir/constant"
	irTypes "github.com/llir/llvm/ir/types"
	"github.com/llir/llvm/ir/value"
	"github.com/pingcap/log"
	"github.com/pingcap/tidb/parser/mysql"
	"github.com/pingcap/tidb/parser/opcode"
	"github.com/pingcap/tidb/parser/types"
	tidbTypes "github.com/pingcap/tidb/types"
	"github.com/pingcap/tidb/util/chunk"
	"github.com/stretchr/testify/require"
	"go.uber.org/zap"
)

type oneDecimalNode struct {
	val value.Value
}

func (n *oneDecimalNode) Compile(ctx gen.CodeGenContext) value.Value {
	return n.val
}

func (n *oneDecimalNode) GetIRType() (irTypes.Type, error) {
	return irTypes.NewPointer(aot.DecimalType), nil
}

func TestDecimalBinOp(t *testing.T) {
	chunkTypes := []*types.FieldType{
		types.NewFieldType(mysql.TypeNewDecimal),
		types.NewFieldType(mysql.TypeNewDecimal),
		types.NewFieldType(mysql.TypeNewDecimal)}
	inputChunk := chunk.New(chunkTypes, 1024, 1024)

	var dec tidbTypes.MyDecimal
	for i := 0; i < 100; i++ {
		dec.FromInt(int64(i))
		inputChunk.AppendMyDecimal(0, &dec)
		inputChunk.AppendMyDecimal(1, &dec)
	}
	inputChunk.Column(2).ResizeDecimal(100, false)

	codeGenCtx := gen.NewCodeGenContextWithChunkReader()
	val1 := codeGenCtx.InputReader().ReadDecimal(codeGenCtx, 0, constant.NewInt(irTypes.I64, 5))
	val2 := codeGenCtx.InputReader().ReadDecimal(codeGenCtx, 1, constant.NewInt(irTypes.I64, 6))
	opNode := &DecimalBinOp{
		Left:  &oneDecimalNode{val1},
		Right: &oneDecimalNode{val2},
		Op:    opcode.Mul,
	}
	resultVal := opNode.Compile(codeGenCtx)
	codeGenCtx.OutputWriter().PutDecimal(codeGenCtx, constant.NewInt(irTypes.I64, 0), resultVal)
	codeGenCtx.Block().NewRet(constant.NewInt(irTypes.I64, 0))

	asmText := aot.DecimalModule.String()
	asmText += codeGenCtx.Module().String()
	log.Info("compiled IR", zap.String("asm", asmText))

	fn := compile.LLVMCompileIR([]byte(asmText))
	inputVec := []uintptr{
		0,
		uintptr(unsafe.Pointer(&inputChunk.Column(2).Int64s()[0])),
		uintptr(unsafe.Pointer(&inputChunk.Column(0).Int64s()[0])),
		uintptr(unsafe.Pointer(&inputChunk.Column(1).Int64s()[0])),
	}
	inputParam := uintptr(unsafe.Pointer(&inputVec[0]))
	log.Info("input",
		zap.Uintptr("ptr", inputParam),
		zap.Any("vec", inputVec))
	res, err := fn(inputParam)
	require.NoError(t, err)
	require.Equal(t, uintptr(0), res)

	resultDec := inputChunk.Column(2).GetDecimal(0)
	resultInt, err := resultDec.ToInt()
	require.NoError(t, err)
	require.Equal(t, int64(30), resultInt)
}

func TestDecimalMulLoop(t *testing.T) {
	decimalMulLoop(174657)
}

func decimalMulLoop(N int) {
	chunkTypes := []*types.FieldType{
		types.NewFieldType(mysql.TypeNewDecimal),
		types.NewFieldType(mysql.TypeNewDecimal),
		types.NewFieldType(mysql.TypeNewDecimal)}
	inputChunk := chunk.New(chunkTypes, N, N)
	var dec tidbTypes.MyDecimal
	for i := 0; i < N; i++ {
		dec.FromInt(int64(i))
		inputChunk.AppendMyDecimal(0, &dec)
		inputChunk.AppendMyDecimal(1, &dec)
	}
	inputChunk.Column(2).ResizeDecimal(N, false)

	codeGenCtx := gen.NewCodeGenContextWithChunkReader()
	loopCtx := codeGenCtx.Loop(constant.NewInt(irTypes.I64, int64(N)))

	val1 := loopCtx.InputReader().ReadDecimal(loopCtx, 0, loopCtx.LoopVar())
	val2 := loopCtx.InputReader().ReadDecimal(loopCtx, 1, loopCtx.LoopVar())
	opNode := &DecimalBinOp{
		Left:  &oneDecimalNode{val1},
		Right: &oneDecimalNode{val2},
		Op:    opcode.Mul,
	}
	resultVal := opNode.Compile(loopCtx)
	loopCtx.OutputWriter().PutDecimal(loopCtx, loopCtx.LoopVar(), resultVal)
	loopCtx.FinishLoop()
	codeGenCtx.Block().NewRet(constant.NewInt(irTypes.I64, 0))

	asmText := aot.DecimalModule.String()
	asmText += codeGenCtx.Module().String()
	log.Info("compiled IR", zap.String("asm", asmText))

	input0 := unsafe.Pointer(&inputChunk.Column(2).Int64s()[0])
	input1 := unsafe.Pointer(&inputChunk.Column(0).Int64s()[0])
	input2 := unsafe.Pointer(&inputChunk.Column(1).Int64s()[0])
	fn := compile.LLVMCompileIR([]byte(asmText))
	inputVec := []uintptr{
		0,
		uintptr(input0),
		uintptr(input1),
		uintptr(input2),
	}
	_, _ = fn(uintptr(unsafe.Pointer(&inputVec[0])))
	runtime.KeepAlive(inputChunk)
	runtime.KeepAlive(input0)
	runtime.KeepAlive(input1)
	runtime.KeepAlive(input2)
	runtime.KeepAlive(inputVec)
}

func BenchmarkDecimalMul(b *testing.B) {
	N := b.N

	chunkTypes := []*types.FieldType{
		types.NewFieldType(mysql.TypeNewDecimal),
		types.NewFieldType(mysql.TypeNewDecimal),
		types.NewFieldType(mysql.TypeNewDecimal)}
	inputChunk := chunk.New(chunkTypes, N, N)
	var dec tidbTypes.MyDecimal
	for i := 0; i < N; i++ {
		dec.FromInt(int64(i))
		inputChunk.AppendMyDecimal(0, &dec)
		inputChunk.AppendMyDecimal(1, &dec)
	}
	inputChunk.Column(2).ResizeDecimal(N, false)

	codeGenCtx := gen.NewCodeGenContextWithChunkReader()
	loopCtx := codeGenCtx.Loop(constant.NewInt(irTypes.I64, int64(N)))

	val1 := loopCtx.InputReader().ReadDecimal(loopCtx, 0, loopCtx.LoopVar())
	val2 := loopCtx.InputReader().ReadDecimal(loopCtx, 1, loopCtx.LoopVar())
	opNode := &DecimalBinOp{
		Left:  &oneDecimalNode{val1},
		Right: &oneDecimalNode{val2},
		Op:    opcode.Mul,
	}
	resultVal := opNode.Compile(loopCtx)
	loopCtx.OutputWriter().PutDecimal(loopCtx, loopCtx.LoopVar(), resultVal)
	loopCtx.FinishLoop()
	codeGenCtx.Block().NewRet(constant.NewInt(irTypes.I64, 0))

	asmText := aot.DecimalModule.String()
	asmText += codeGenCtx.Module().String()
	log.Info("compiled IR", zap.String("asm", asmText))

	input0 := unsafe.Pointer(&inputChunk.Column(2).Int64s()[0])
	input1 := unsafe.Pointer(&inputChunk.Column(0).Int64s()[0])
	input2 := unsafe.Pointer(&inputChunk.Column(1).Int64s()[0])
	fn := compile.LLVMCompileIR([]byte(asmText))
	inputVec := []uintptr{
		0,
		uintptr(input0),
		uintptr(input1),
		uintptr(input2),
	}
	b.ResetTimer()
	res, err := fn(uintptr(unsafe.Pointer(&inputVec[0])))
	if err != nil {
		b.FailNow()
	}
	if res != 0 {
		b.FailNow()
	}
	runtime.KeepAlive(inputChunk)
	runtime.KeepAlive(input0)
	runtime.KeepAlive(input1)
	runtime.KeepAlive(input2)
	runtime.KeepAlive(inputVec)
}


func TestDecimalStructSize(t *testing.T) {
	ctx := gen.NewCodeGenContext("")
	val := ctx.Block().NewAlloca(aot.DecimalType)
	offSetPtr := ctx.Block().NewGetElementPtr(
		aot.DecimalType,
		val,
		constant.NewInt(irTypes.I64, 1))
	offSet := ctx.Block().NewPtrToInt(offSetPtr, irTypes.I64)
	origin := ctx.Block().NewPtrToInt(val, irTypes.I64)
	diff := ctx.Block().NewSub(offSet, origin)
	ctx.Block().NewRet(diff)

	asm := aot.DecimalModule.String() + ctx.Module().String()
	fn := compile.LLVMCompileIR([]byte(asm))
	ret, err := fn(0)
	require.NoError(t, err)
	require.Equal(t, uintptr(40), ret)
}