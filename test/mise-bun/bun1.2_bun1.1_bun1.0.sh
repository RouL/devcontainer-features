#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default bun == 1.2.*" bash -c "bun --version | grep -E '^1\\.2\\.'"
check "check bun 1.1.*" bash -c "mise exec bun@1.1 -- bun --version | grep -E '^1\\.1\\.'"
check "check bun 1.0.*" bash -c "mise exec bun@1.0 -- bun --version | grep -E '^1\\.0\\.'"

reportResults
