#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default bun == 1.1.*" bash -c "bun --version | grep -E '^1\\.1\\.'"

reportResults
