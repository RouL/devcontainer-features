#!/bin/bash
set -e

sudo apt-get update -y > /dev/null
sudo apt-get install -y curl jq ca-certificates > /dev/null

CURRENT_VERSION="$(curl -L --no-progress-meter https://api.github.com/repos/oven-sh/bun/releases/latest | jq --raw-output '.tag_name')"
CURRENT_VERSION="${CURRENT_VERSION#bun-v}"

source dev-container-features-test-lib

check "check default bun == latest ($CURRENT_VERSION)" bash -c "bun --version | grep -E '^${CURRENT_VERSION//\./\\.}\$'"

reportResults
