package ast

import (
	irTypes "github.com/llir/llvm/ir/types"
	"github.com/pingcap/tidb/types"
)

func IRTypeFromEvalType(tp types.EvalType) irTypes.Type {
	switch tp {
	case types.ETInt:
		return irTypes.I64
	case types.ETReal:
		return irTypes.Float
	default:
		return nil
	}
}
