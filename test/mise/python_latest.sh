#!/bin/bash
set -e

source dev-container-features-test-lib

check "install python@latest" bash -c "mise install python@latest"
check "check python@latest" bash -c "mise exec python@latest -- python --version | grep -E '^Python 3\\.'"

reportResults
