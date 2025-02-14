#!/bin/bash
set -e

serverVals='{
    "api": "https://example.com/api",
    "webVault": "https://example.com/web_vault",
    "identity": "https://example.com/identity",
    "icons": "https://example.com/icons",
    "notifications": "https://example.com/notifications",
    "events": "https://example.com/events",
    "keyConnector": "https://example.com/key_connector"
}'

source dev-container-features-test-lib

check "bw config server => https://example.com" bash -c "bw config server | grep '^https://example.com\$'"

for serverVar in `echo $serverVals | jq --raw-output "keys | .[]"`
do
    serverVal="$(echo $serverVals | jq --raw-output ".$serverVar")"
    check "server config $serverVar => $serverVal" bash -c "cat ~/.config/Bitwarden\ CLI/data.json | jq --raw-output '.global_environment_environment.urls.$serverVar' | grep '^$serverVal\$'"
done
