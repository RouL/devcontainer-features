#!/bin/bash
set -e

export PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"

sudo apt-get update -y > /dev/null
sudo apt-get install -y curl jq ca-certificates > /dev/null

CURRENT_VERSION="$(curl -L --no-progress-meter https://rubygems.org/api/v1/gems/kamal.json | jq --raw-output '.version')"

source dev-container-features-test-lib
source functions.sh

check_kamal_version "$CURRENT_VERSION"

reportResults
