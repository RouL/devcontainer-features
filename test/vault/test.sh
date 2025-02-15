#!/bin/bash
set -e

source dev-container-features-test-lib

check "vault --version" bash -c "vault --version | grep -E '^Vault v[1-9][0-9]*\\.[0-9]+\\.[0-9]+ '"
