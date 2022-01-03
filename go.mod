module github.com/liuzix/ticompile

go 1.17

require (
	github.com/llir/llvm v0.3.4
	github.com/pingcap/errors v0.11.5-0.20211224045212-9687c2b0f87c
	github.com/pingcap/log v0.0.0-20211215031037-e024ba4eb0ee
	github.com/pingcap/tidb v0.0.0-unpublished
	github.com/pingcap/tidb/parser v0.0.0-unpublished
	github.com/stretchr/testify v1.7.0
	go.uber.org/zap v1.19.1
)

require (
	github.com/BurntSushi/toml v0.3.1 // indirect
	github.com/HdrHistogram/hdrhistogram-go v1.1.2 // indirect
	github.com/StackExchange/wmi v0.0.0-20190523213315-cbe66965904d // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/cespare/xxhash/v2 v2.1.1 // indirect
	github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e // indirect
	github.com/coreos/pkg v0.0.0-20180928190104-399ea9e2e55f // indirect
	github.com/cznic/mathutil v0.0.0-20181122101859-297441e03548 // indirect
	github.com/danjacques/gofslock v0.0.0-20191023191349-0a45f885bc37 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/go-ole/go-ole v1.2.4 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/golang/protobuf v1.5.2 // indirect
	github.com/grpc-ecosystem/go-grpc-middleware v1.1.0 // indirect
	github.com/matttproud/golang_protobuf_extensions v1.0.1 // indirect
	github.com/mewmew/float v0.0.0-20201204173432-505706aa38fa // indirect
	github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e // indirect
	github.com/opentracing/basictracer-go v1.0.0 // indirect
	github.com/opentracing/opentracing-go v1.1.0 // indirect
	github.com/pingcap/failpoint v0.0.0-20210316064728-7acb0f0a3dfd // indirect
	github.com/pingcap/kvproto v0.0.0-20211207042851-78a55fb8e69c // indirect
	github.com/pingcap/tipb v0.0.0-20211227115224-a06a85f9d2a5 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	github.com/prometheus/client_golang v1.5.1 // indirect
	github.com/prometheus/client_model v0.2.0 // indirect
	github.com/prometheus/common v0.9.1 // indirect
	github.com/prometheus/procfs v0.0.8 // indirect
	github.com/remyoudompheng/bigfft v0.0.0-20200410134404-eec4a21b6bb0 // indirect
	github.com/shirou/gopsutil v3.21.3+incompatible // indirect
	github.com/tikv/client-go/v2 v2.0.0-rc.0.20211229051614-62d6b4a2e8f7 // indirect
	github.com/tikv/pd v1.1.0-beta.0.20211118054146-02848d2660ee // indirect
	github.com/uber/jaeger-client-go v2.22.1+incompatible // indirect
	github.com/uber/jaeger-lib v2.4.1+incompatible // indirect
	go.etcd.io/etcd v0.5.0-alpha.5.0.20210512015243-d19fbe541bf9 // indirect
	go.uber.org/atomic v1.9.0 // indirect
	go.uber.org/multierr v1.7.0 // indirect
	golang.org/x/mod v0.5.1 // indirect
	golang.org/x/net v0.0.0-20211015210444-4f30a5c0130f // indirect
	golang.org/x/sync v0.0.0-20210220032951-036812b2e83c // indirect
	golang.org/x/sys v0.0.0-20211216021012-1d35b9e2eb4e // indirect
	golang.org/x/text v0.3.7 // indirect
	golang.org/x/tools v0.1.8 // indirect
	golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1 // indirect
	google.golang.org/genproto v0.0.0-20210825212027-de86158e7fda // indirect
	google.golang.org/grpc v1.40.0 // indirect
	google.golang.org/protobuf v1.27.1 // indirect
	gopkg.in/check.v1 v1.0.0-20200227125254-8fa46927fb4f // indirect
	gopkg.in/natefinch/lumberjack.v2 v2.0.0 // indirect
	gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b // indirect
)

replace (
	github.com/liuzix/ticompile => ./
	github.com/pingcap/tidb => ./tidb
	github.com/pingcap/tidb/parser => ./tidb/parser
)
