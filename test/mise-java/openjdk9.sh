#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default java == 9.*" bash -c "java -version 2>&1 | grep -E '^openjdk version \"9\.'"

reportResults
