package compile

import (
	"github.com/pingcap/tidb/br/pkg/lightning/log"
	"go.uber.org/zap/zapcore"
	"testing"

	"github.com/liuzix/ticompile/program"
	"github.com/stretchr/testify/require"
)

func TestCompileIR(t *testing.T) {
	str := `
        define i64 @jit_main(i64 %x) {
            %tmp = add i64 1, %x
            ret i64 %tmp
        }`
	fn := LLVMCompileIR([]byte(str))
	require.NotNil(t, fn)

	for i := 0; i < 10000; i++ {
		res, err := fn(program.Arg(i))
		require.NoError(t, err)
		require.Equal(t, program.Result(i+1), res)
	}
}

func BenchmarkCompileIR(b *testing.B) {
	str := `
        define i64 @jit_main(i64 %x) {
            %tmp = add i64 1, %x
            ret i64 %tmp
        }`
	log.SetLevel(zapcore.WarnLevel)
	defer log.SetLevel(zapcore.InfoLevel)
	b.ResetTimer()

	for i := 0; i < b.N; i++ {
		fn := LLVMCompileIR([]byte(str))
		if fn == nil {
			b.FailNow()
		}
	}
}
