package ast

import (
	"github.com/liuzix/ticompile/gen"
	irTypes "github.com/llir/llvm/ir/types"
	"github.com/llir/llvm/ir/value"
	"github.com/pingcap/errors"
	"github.com/pingcap/tidb/parser/opcode"
)

type BinOp struct {
	Left  Node
	Right Node
	Op    opcode.Op
}

func (o *BinOp) Compile(ctx gen.CodeGenContext) value.Value {
	lVal := o.Left.Compile(ctx)
	rVal := o.Right.Compile(ctx)

	switch o.Op {
	case opcode.Plus:
		return ctx.Block().NewAdd(lVal, rVal)
	case opcode.Mul:
		return ctx.Block().NewMul(lVal, rVal)
	default:
		panic("implement me")
	}
}

func (o *BinOp) GetIRType() (irTypes.Type, error) {
	lType, err := o.Left.GetIRType()
	if err != nil {
		return nil, errors.Trace(err)
	}

	rType, err := o.Right.GetIRType()
	if err != nil {
		return nil, errors.Trace(err)
	}

	if lType.Equal(rType) {
		return lType, nil
	}

	return nil, errors.Trace(errors.Errorf("BinOp: types of operands not compatible: %s and %s",
		lType.Name(), rType.Name()))
}
