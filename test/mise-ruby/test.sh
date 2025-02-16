#!/bin/bash
set -e

sudo apt-get update -y > /dev/null
sudo apt-get install -y curl jq ca-certificates > /dev/null

CURRENT_VERSION="$(curl -L --no-progress-meter https://api.github.com/repos/ruby/ruby/releases/latest | jq --raw-output '.tag_name')"
CURRENT_VERSION="${CURRENT_VERSION//_/.}"
CURRENT_VERSION="${CURRENT_VERSION#v}"

source dev-container-features-test-lib

check "check default ruby == latest ($CURRENT_VERSION)" bash -c "ruby --version | grep -E '^ruby ${CURRENT_VERSION//\./\\.} '"

reportResults
