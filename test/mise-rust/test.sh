#!/bin/bash
set -e

sudo apt-get update -y > /dev/null
sudo apt-get install -y curl jq ca-certificates > /dev/null

CURRENT_VERSION="$(curl -L --no-progress-meter https://api.github.com/repos/rust-lang/rust/releases/latest | jq --raw-output '.tag_name')"

source dev-container-features-test-lib

check "check default rustc == latest ($CURRENT_VERSION)" bash -c "rustc --version | grep -E '^rustc ${CURRENT_VERSION//\./\\.} '"
check "check default cargo == latest ($CURRENT_VERSION)" bash -c "cargo --version | grep -E '^cargo ${CURRENT_VERSION//\./\\.} '"

reportResults
