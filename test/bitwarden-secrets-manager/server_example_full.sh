#!/bin/bash
set -e

source dev-container-features-test-lib

check "server config server-base => https://example.com" bash -c "grep -E '^server_base = \"https://example.com\"\$' ~/.config/bws/config"
check "server config server-api => https://example.com/api" bash -c "grep -E '^server_api = \"https://example.com/api\"\$' ~/.config/bws/config"
check "server config server-identity => https://example.com/identity" bash -c "grep -E '^server_identity = \"https://example.com/identity\"\$' ~/.config/bws/config"
