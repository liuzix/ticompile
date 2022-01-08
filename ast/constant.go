package ast

import (
	"github.com/liuzix/ticompile/gen"
	irTypes "github.com/llir/llvm/ir/types"
	"github.com/llir/llvm/ir/value"
	"github.com/pingcap/tidb/types"
)

type Constant struct {
	evalTp types.EvalType
	integer int
	decimal types.MyDecimal
}

func (c Constant) Compile(ctx gen.CodeGenContext) value.Value {
	panic("implement me")
}

func (c Constant) GetIRType() (irTypes.Type, error) {
	panic("implement me")
}
