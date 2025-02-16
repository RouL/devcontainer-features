#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default ruby == 3.4.*" bash -c "ruby --version | grep -E '^ruby 3\\.4\\.'"
check "check ruby 3.3.*" bash -c "mise exec ruby@3.3 -- ruby --version | grep -E '^ruby 3\\.3\\.'"
check "check ruby 3.2.*" bash -c "mise exec ruby@3.2 -- ruby --version | grep -E '^ruby 3\\.2\\.'"

reportResults
