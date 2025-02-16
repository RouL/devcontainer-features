#!/bin/sh
set -e

GEM_NAME="kamal"
VERSION="${VERSION}"
USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

error() {
    echo "$1" >&2
    echo "Exiting..." >&2
    exit 1
}

check_ruby_env() {
    if command -v ruby > /dev/null; then
        export RUBY_ENV="ruby"
    elif command -v mise > /dev/null; then
        export RUBY_ENV="mise"
    elif command -v rbenv > /dev/null; then
        export RUBY_ENV="rbenv"
    else
        error "ERROR: Couldn't find ruby"
    fi
}

gem_install() {
    PARAMS="$@"

    case $RUBY_ENV in
        ruby)
            su $USERNAME -c "gem install $PARAMS"
            ;;
        mise)
            su $USERNAME -c "mise exec -- gem install $PARAMS"
            ;;
        rbenv)
            su $USERNAME -c "rbenv exec gem install $PARAMS"
            ;;
    esac
}

install() {
    VERSION_PARAM=
    if [ "$VERSION" != "" ]; then
        VERSION_PARAM="--version $VERSION"
    fi

    gem_install --no-document $VERSION_PARAM $GEM_NAME
}

check_ruby_env

echo "(*) Installing Kamal Deploy ($RUBY_ENV)..."

install

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done!"
