#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default rustc == 1.80.*" bash -c "rustc --version | grep -E '^rustc 1\\.80\\.'"
check "check default cargo == 1.80.*" bash -c "cargo --version | grep -E '^cargo 1\\.80\\.'"

reportResults
