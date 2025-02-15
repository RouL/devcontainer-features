#!/bin/bash
set -e

source dev-container-features-test-lib

check "vault --version" bash -c "vault --version | grep -E '^Vault v1\\.17\\.6 '"
