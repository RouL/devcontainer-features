#!/bin/bash
set -e

source dev-container-features-test-lib

check "bws --version" bash -c "bws --version | grep -E '^bws [1-9][0-9]*\\.[0-9]+\\.[0-9]+\$'"
