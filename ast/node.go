package ast

import (
	"github.com/liuzix/ticompile/gen"
	irTypes "github.com/llir/llvm/ir/types"
	"github.com/llir/llvm/ir/value"
)

type Node interface {
	Compile(ctx gen.CodeGenContext) value.Value
	GetIRType() (irTypes.Type, error)
}
