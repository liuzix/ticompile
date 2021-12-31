PARALLEL=4
GOTEST := CGO_ENABLED=1 go test -p $(PARALLEL) --race
FAIL_ON_STDOUT := awk '{ print  } END { if (NR > 0) { exit 1  }  }'

PACKAGE_LIST := go list ./...
PACKAGES := $$($(PACKAGE_LIST))
GOFILES := $$(find . -name '*.go' -type f | grep -vE 'tidb/')

unit_test:
	$(GOTEST) $(PACKAGES)

build_unit_test:
	$(GOTEST) $(PACKAGES) -c

tools_setup:
	@echo "setup build and check tools"
	@cd tools && make

fmt:
	@echo "gofmt (simplify)"
	tools/bin/gofumports -l -w $(GOFILES) 2>&1 | $(FAIL_ON_STDOUT)

lint:
	echo "golangci-lint"; \
	tools/bin/golangci-lint run --config=./.golangci.yml --timeout 10m0s

tidy:
	@echo "check go mod tidy"
	go mod tidy

check: tools_setup lint fmt tidy