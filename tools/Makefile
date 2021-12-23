all: gofumports golangci-lint

gofumports:
	go build -o bin/$@ mvdan.cc/gofumpt/gofumports

golangci-lint:
	go build -o bin/$@ github.com/golangci/golangci-lint/cmd/golangci-lint