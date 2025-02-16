#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default go == 1.24.*" bash -c "go version | grep -E '^go version go1\\.24\\.'"
check "check go@1.23" bash -c "mise exec go@1.23 -- go version | grep -E '^go version go1\\.23\\.'"
check "check go@1.22" bash -c "mise exec go@1.22 -- go version | grep -E '^go version go1\\.22\\.'"

reportResults
