#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default go == 1.23.*" bash -c "go version | grep -E '^go version go1\\.23\\.'"

reportResults
