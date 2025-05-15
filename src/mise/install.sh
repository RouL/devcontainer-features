#!/usr/bin/bash
set -e

REQUIRED_PACKAGES="curl sudo ca-certificates"
RUBY_BUILD_DEPENDENCIES="autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev libffi-dev"
PYTHON_BUILD_DEPENDENCIES="build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl git libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev"

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

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
    curl https://mise.run | MISE_INSTALL_PATH=/usr/local/bin/mise sh
    eval "$(mise activate bash)"
    mise doctor
    cat > /etc/profile.d/mise.sh << EOF
if [ -n "\$ZSH_VERSION" ]; then
   eval "\$(mise activate zsh)"
elif [ -n "\$BASH_VERSION" ]; then
   eval "\$(mise activate bash)"
fi
EOF
}
    chmod a+x /etc/profile.d/mise.sh
    cat >> $_REMOTE_USER_HOME/.bashrc << EOF
eval "\$(mise activate bash)"
EOF
    cat >> $_REMOTE_USER_HOME/.zshrc << EOF
eval "\$(mise activate zsh)"
EOF

echo "(*) Installing mise-en-place..."

install

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done!"
