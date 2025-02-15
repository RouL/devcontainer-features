#!/bin/sh
set -e

SERVER_BASE="${SERVER_BASE}"
SERVER_API="${SERVER_API}"
SERVER_IDENTITY="${SERVER_IDENTITY}"

REQUIRED_PACKAGES="curl unzip sudo ca-certificates jq"
TARGET_PATH=/usr/local/bin/bws

error() {
    echo "$1" >&2
    echo "Exiting..." >&2
    exit 1
}

apt_get_update()
{
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    fi
}

platform_detect() {
    if [ "$(uname -s)" = "Linux" ]; then
        PLATFORM="unknown-linux-gnu"
    elif [ "$(uname -s)" = "Darwin" ]; then
        PLATFORM="apple-darwin"
    else
        error "Unsupported platform: $(uname -s)"
    fi
}

arch_detect() {
    if [ "$(uname -m)" = "x86_64" ]; then
        ARCH="x86_64"
    elif [ "$(uname -m)" = "aarch64" ]; then # Linux
        ARCH="aarch64"
    elif [ "$(uname -m)" = "arm64" ]; then # Darwin/macOS
        ARCH="aarch64"
    else
        error "Unsupported architecture: $(uname -m)"
    fi
}

export DEBIAN_FRONTEND=noninteractive

check_packages $REQUIRED_PACKAGES

CURRENT_TAG="$(curl --request GET https://api.github.com/repos/bitwarden/sdk-sm/releases?per_page=100 | jq --raw-output '[.[] | select(.draft == false) | select(.prerelease == false) | select(.tag_name | startswith("bws-")) | .tag_name][0]')"
CURRENT_VERSION="${CURRENT_TAG#bws-v}"
VERSION="${VERSION:-$CURRENT_VERSION}"

platform_detect
arch_detect

install() {
    curl -L "https://github.com/bitwarden/sdk-sm/releases/download/bws-v${VERSION}/bws-${ARCH}-${PLATFORM}-${VERSION}.zip" -o bws.zip

    unzip bws.zip
    rm bws.zip

    chmod a+x bws
    mv bws $TARGET_PATH
}

configure() {
    configCmd="sudo -u ${_REMOTE_USER} -i ${TARGET_PATH} config"

    [ "${SERVER_BASE}" != "" ] && $configCmd server-base $SERVER_BASE
    [ "${SERVER_API}" != "" ] && $configCmd server-api $SERVER_API
    [ "${SERVER_IDENTITY}" != "" ] && $configCmd server-identity $SERVER_IDENTITY

    return 0
}

echo "(*) Installing Bitwarden Secrets Manager CLI..."

install

if [ "${SERVER_BASE}" != "" ] || [ "${SERVER_API}" != "" ] || [ "${SERVER_IDENTITY}" != "" ]; then
    echo "(*) Configure custom Bitwarden server URLs..."
    configure
fi

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done!"
