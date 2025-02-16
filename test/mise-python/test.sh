#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default python" bash -c "python --version | grep -E '^Python '"

reportResults
