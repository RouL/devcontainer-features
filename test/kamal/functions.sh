set -e

check_kamal_version() {
    VERSION="$1"

    check "kamal version == $VERSION" bash -c "kamal version | grep -E '^${VERSION//\./\\.}\$' > /dev/null"
}
