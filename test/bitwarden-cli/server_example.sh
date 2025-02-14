#!/bin/bash
set -e

serverVals='{
    "api": null,
    "identity": null,
    "webVault": null,
    "icons": null,
    "notifications": null,
    "events": null,
    "keyConnector": null
}'

source dev-container-features-test-lib

check "bw config server => https://example.com" bash -c "bw config server | grep '^https://example.com\$'"

for serverVar in `echo $serverVals | jq --raw-output "keys | .[]"`
do
    serverVal="$(echo $serverVals | jq --raw-output ".$serverVar")"
    check "server config $serverVar => $serverVal" bash -c "cat ~/.config/Bitwarden\ CLI/data.json | jq --raw-output '.global_environment_environment.urls.$serverVar' | grep '^$serverVal\$'"
done
