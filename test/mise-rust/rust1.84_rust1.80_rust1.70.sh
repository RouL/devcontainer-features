#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default rustc == 1.84.*" bash -c "rustc --version | grep -E '^rustc 1\\.84\\.'"
check "check default cargo == 1.84.*" bash -c "cargo --version | grep -E '^cargo 1\\.84\\.'"

check "check rustc 1.80.*" bash -c "mise exec rust@1.80 -- rustc --version | grep -E '^rustc 1\\.80\\.'"
check "check cargo 1.80.*" bash -c "mise exec rust@1.80 -- cargo --version | grep -E '^cargo 1\\.80\\.'"

check "check rustc 1.70.*" bash -c "mise exec rust@1.70 -- rustc --version | grep -E '^rustc 1\\.70\\.'"
check "check cargo 1.70.*" bash -c "mise exec rust@1.70 -- cargo --version | grep -E '^cargo 1\\.70\\.'"

reportResults
