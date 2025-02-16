#!/usr/bin/bash
set -e

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"
VERSION="${VERSION:-latest}"

REQUIRED_PACKAGES="git ca-certificates"

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

export DEBIAN_FRONTEND=noninteractive

check_packages $REQUIRED_PACKAGES

install() {
    su ${USERNAME} -c "mise use --global go@${VERSION}"
}

echo "(*) Installing Go (${VERSION}) via mise as default..."

install

for extraVersion in $EXTRA_VERSIONS
do
    echo "(*) Installung Go (${extraVersion}) via mise"
    su ${USERNAME} -c "mise install go@${extraVersion}"
done

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done!"
