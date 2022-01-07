package ast

import (
	"github.com/liuzix/ticompile/gen/aot"
	irTypes "github.com/llir/llvm/ir/types"
	"github.com/pingcap/tidb/types"
)

func IRTypeFromEvalType(tp types.EvalType) irTypes.Type {
	switch tp {
	case types.ETInt:
		return irTypes.I64
	case types.ETDecimal:
		return irTypes.NewPointer(aot.DecimalType)
	default:
		return nil
	}
}
