#!/bin/bash
set -e

source dev-container-features-test-lib

check "check default java == 1.8.*" bash -c "java -version 2>&1 | grep -E '^openjdk version \"1\.8\.'"
check "check java 20.*" bash -c "mise exec java@temurin-20 -- java -version 2>&1 | grep -E '^openjdk version \"20\.'"
check "check java 19.*" bash -c "mise exec java@corretto-19 -- java -version 2>&1 | grep -E '^openjdk version \"19\.'"

reportResults
