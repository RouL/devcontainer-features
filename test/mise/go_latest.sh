#!/bin/bash
set -e

source dev-container-features-test-lib

check "install go@latest" bash -c "mise install go@latest"
check "check go@latest" bash -c "mise exec go@latest -- go version | grep -E '^go version go[1-9][0-9]*\\.([0-9]|[1-9][0-9]+)\\.([0-9]|[1-9][0-9]+) '"

reportResults
