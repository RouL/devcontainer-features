#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default java" bash -c "java -version 2>&1 | grep -E '^openjdk version \"[1-9][0-9]*\"'"

reportResults
