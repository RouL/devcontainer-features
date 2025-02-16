#!/bin/bash
set -e

sudo apt-get update -y > /dev/null
sudo apt-get install -y curl jq ca-certificates > /dev/null

CURRENT_VERSION="$(curl -L --no-progress-meter https://api.github.com/repos/jdx/mise/releases/latest | jq --raw-output '.tag_name')"
CURRENT_VERSION="${CURRENT_VERSION#v}"

source dev-container-features-test-lib

check "mise --version == $CURRENT_VERSION" bash -c "mise --version | grep -E '^${CURRENT_VERSION//\./\\.} '"
check "mise doctor" bash -c "mise doctor"

reportResults
