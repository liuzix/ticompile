package compile

import "github.com/liuzix/ticompile/program"

var trampoline = buildTrampoline()

func CallTrampoline(ptr, arg program.Arg) (program.Result, error) {
	ret, err := trampoline.Execute(ptr, arg)
	if err != nil {
		return 0, err
	}
	return ret, nil
}

func buildTrampoline() *program.MachineCode {
	asm := []byte{
		0x48, 0x89, 0xDF, // mov rdi, rbx
		0xFF, 0xD0, // call rax
		0xC3, // ret
	}
	return program.NewMachineCode(asm)
}
