#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default go" bash -c "go version | grep -E '^go version go[1-9][0-9]*\\.'"

reportResults
