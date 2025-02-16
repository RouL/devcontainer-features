#!/bin/bash
set -e

source dev-container-features-test-lib

check "install node@latest" bash -c "mise install node@latest"
check "check node@latest" bash -c "mise exec node@latest -- node --version | grep -E '^v[1-9][0-9]*\\.([0-9]|[1-9][0-9]+)\\.([0-9]|[1-9][0-9]+)\$'"

reportResults
