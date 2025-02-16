#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default python == 3.12" bash -c "python --version | grep -E '^Python 3\\.12\\.'"

reportResults
