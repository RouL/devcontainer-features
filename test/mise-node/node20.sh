#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default node == 20.*" bash -c "node --version | grep -E '^v20\\.'"

reportResults
