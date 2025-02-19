# Dev Container Features

## Contents

This repository contains the following features:

- [Bitwarden CLI (bw)](./src/bitwarden-cli/README.md): Installs the bitwarden CLI (bw) and optionally configures it to use a self-hosted server.
- [Bitwarden Secrets Manager CLI (bws)](./src/bitwarden-secrets-manager/README.md): Installs the bitwarden secrets manager CLI (bws) and optionally configures it to use a self-hosted server.
- [Kamal Deploy](./src/kamal/README.md): Installs Kamal Deploy directly via rubygems.
- [mise-en-place version manager](./src/mise/README.md): Installs mise-en-place version manager.
- [Bun (mise)](./src/mise-bun/README.md): Installs Bun via mise-en-place version manager.
- [Go (mise)](./src/mise-golang/README.md): Installs Go via mise-en-place version manager.
- [Node.js (mise)](./src/mise-node/README.md): Installs Node.js via mise-en-place version manager.
- [Python (mise)](./src/mise-python/README.md): Installs Python via mise-en-place version manager.
- [Ruby (mise)](./src/mise-ruby/README.md): Installs Ruby via mise-en-place version manager.
- [Rust (mise)](./src/mise-rust/README.md): Installs Rust via mise-en-place version manager.
- [HashiCorp Vault](./src/vault/README.md): Installs the HashiCorp Vault binary.

## Usage

To use the features from this repository, add the desired features to devcontainer.json.

This example uses the **kamal** feature:

```json
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/roul/devcontainer-features/kamal:1": {}
    }
}
```
