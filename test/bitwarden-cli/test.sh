#!/bin/bash
set -e

source dev-container-features-test-lib

check "bw --version" bash -c "bw --version | grep -E '^20(2[5-9]|[3-9][0-9])\\.([1-9]|1[0-2])\\.([1-9]|[1-2][0-9]|3[0-1])'"
check "bw config server => https://bitwarden.com" bash -c "bw config server | grep '^https://bitwarden.com\$'"
