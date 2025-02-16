#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default node" bash -c "node --version | grep -E '^v[1-9][0-9]*\\.'"

reportResults
