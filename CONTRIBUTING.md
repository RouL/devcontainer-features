# Contributing code

This repository is a collection of dev container Features managed by [Markus Zhang].
This repository will **only accept improvements and
bug fixes** for the [current set of maintained Features].

If you're looking to create a new Feature, then I'd encourage adding it to a
separate repository of your control. The [devcontainers/feature-starter]
repository has more guidance on self authoring Features.

Once you've self authored the Features and if you'd like to share them with
the community, I'd recommend [adding it to the index].

If you've identified an issue and you want to fix it, here's how you can get
started:

1. Fork the repo
2. Open the repo in your editor
3. Add your changes to your workspace
4. Add additional tests to your workspace if neccessary
5. Test your changes using `bin/test <feature name>` to make sure everything still works
6. Bump the version of the feature you changed according to [semver]
7. Commit & push your changes
8. Open a PR to get your changes merged

[Markus Zhang]: https://github.com/RouL
[current set of maintained Features]: https://github.com/RouL/devcontainer-features/tree/main/src
[devcontainers/feature-starter]: https://github.com/devcontainers/feature-starter#readme
[adding it to the index]: https://github.com/devcontainers/feature-starter#adding-features-to-the-index
[semver]: https://semver.org/
