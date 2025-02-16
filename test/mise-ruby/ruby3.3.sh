#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default ruby == 3.3.*" bash -c "ruby --version | grep -E '^ruby 3\\.3\\.'"

reportResults
