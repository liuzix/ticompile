package program

type PlatformABI interface {
	// ConvertToGoABI converts the native calling convention to
	// Go calling convention. The MachineCode object is modified.
	ConvertToGoABI(code *MachineCode) error
}

type AMD64PlatformABI struct{}

func NewAMD64PlatformABI() PlatformABI {
	return &AMD64PlatformABI{}
}

var amd64Prolog = []byte{
	0x48, 0x89, 0xC7, // mov rdi,rax
}

func (p *AMD64PlatformABI) ConvertToGoABI(code *MachineCode) error {
	if err := code.Release(); err != nil {
		return err
	}

	newCodeLen := len(amd64Prolog) + len(code.Code)
	newCode := make([]byte, 0, newCodeLen)
	newCode = append(newCode, amd64Prolog...)
	newCode = append(newCode, code.Code...)

	code.Code = newCode
	return nil
}
