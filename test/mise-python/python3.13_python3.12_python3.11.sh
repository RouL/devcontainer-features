#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default python == 3.13" bash -c "python --version | grep -E '^Python 3\\.13\\.'"
check "check python@3.12" bash -c "mise exec python@3.12 -- python --version | grep -E '^Python 3\\.12\\.'"
check "check python@3.11" bash -c "mise exec python@3.11 -- python --version | grep -E '^Python 3\\.11\\.'"

reportResults
