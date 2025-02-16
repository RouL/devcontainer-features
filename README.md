# Dev Container Features

## Contents

This repository contains the following features:

- [Bitwarden](./src/bitwarden-cli/README.md): CLI (bw) Installs the bitwarden CLI (bw) and optionally configures it to use a self-hosted server.
- [Bitwarden](./src/bitwarden-secrets-manager/README.md): Secrets Manager CLI (bws) Installs the bitwarden secrets manager CLI (bws) and optionally configures it to use a self-hosted server.
- [Kamal](./src/kamal/README.md): Deploy Installs Kamal Deploy directly via rubygems.
- [mise-en-place](./src/mise/README.md): version manager Installs mise-en-place version manager.
- [Bun](./src/mise-bun/README.md): (mise) Installs Bun via mise-en-place version manager.
- [Go](./src/mise-golang/README.md): (mise) Installs Go via mise-en-place version manager.
- [Node.js](./src/mise-node/README.md): (mise) Installs Node.js via mise-en-place version manager.
- [Node.js](./src/mise-python/README.md): (mise) Installs Node.js via mise-en-place version manager.
- [Ruby](./src/mise-ruby/README.md): (mise) Installs Ruby via mise-en-place version manager.
- [Rust](./src/mise-rust/README.md): (mise) Installs Rust via mise-en-place version manager.
- [HashiCorp](./src/vault/README.md): Vault Installs the HashiCorp Vault binary.

## Usage

To use the features from this repository, add the desired features to devcontainer.json.

This example uses the **kamal** feature:

```json
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/RouL/devcontainer-features/kamal:1": {}
    }
}
```
