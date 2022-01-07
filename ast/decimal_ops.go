package ast

import (
	"github.com/liuzix/ticompile/gen"
	"github.com/liuzix/ticompile/gen/aot"
	irTypes "github.com/llir/llvm/ir/types"
	"github.com/llir/llvm/ir/value"
	"github.com/pingcap/log"
	"github.com/pingcap/tidb/parser/opcode"
	"go.uber.org/zap"
)

type DecimalBinOp struct {
	Left  Node
	Right Node
	Op    opcode.Op
}


func (o *DecimalBinOp) Compile(ctx gen.CodeGenContext) value.Value {
	decimalPtrType := irTypes.NewPointer(aot.DecimalType)

	// Type check to help catch error at runtime
	leftType, err := o.Left.GetIRType()
	if err != nil {
		log.Panic("failed to compile", zap.Error(err))
	}
	if !decimalPtrType.Equal(leftType) {
		log.Panic("type check failed", zap.Any("left-type", leftType))
	}

	rightType, err := o.Left.GetIRType()
	if err != nil {
		log.Panic("failed to compile", zap.Error(err))
	}
	if !decimalPtrType.Equal(rightType) {
		log.Panic("type check failed", zap.Any("right-type", rightType))
	}

	switch o.Op {
	case opcode.Mul:
		return o.compileMul(ctx)
	default:
		panic("implement me")
	}
}

func (o *DecimalBinOp) compileMul(ctx gen.CodeGenContext) value.Value {
	leftVal := o.Left.Compile(ctx)
	rightVal := o.Right.Compile(ctx)
	stackVar := ctx.Block().NewAlloca(aot.DecimalType)
	stackVar.Align = 4
	ctx.Block().NewCall(aot.DecimalMulFunction, leftVal, rightVal, stackVar)
	return stackVar
}

func (o *DecimalBinOp) GetIRType() (irTypes.Type, error) {
	return irTypes.NewPointer(aot.DecimalType), nil
}
