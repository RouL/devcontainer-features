#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default node == 23.*" bash -c "node --version | grep -E '^v23\\.'"
check "check node@22" bash -c "mise exec node@22 -- node --version | grep -E '^v22\\.'"
check "check node@20" bash -c "mise exec node@20 -- node --version | grep -E '^v20\\.'"

reportResults
