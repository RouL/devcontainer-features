#!/bin/bash
set -e

source dev-container-features-test-lib

check "server config server-base => https://example.com" bash -c "grep -E '^server_base = \"https://example.com\"\$' ~/.config/bws/config"
