A collection of random scripts and commands to speed up my workflows

## macOS setup

Run `setup/macos/all.sh` to apply system tweaks, install dev tools, and install apps.
You can also run the scripts individually:

- `setup/macos/system-tweaks.sh`
- `setup/macos/install-dev.sh`
- `setup/macos/apps.sh`

Notes:

- `setup/macos/install-dev.sh` expects Xcode Command Line Tools (triggered by running `git` once).
- `setup/macos/apps.sh` requires Homebrew

## Git Scripts:

### `git what`

Prints the last n branches that have been checked out in case you forget the names of the branches you were working on in repos with lots of branches. Defaults to the last 5 branches.

### `git default`

Checks out the default branch for `origin`. Pass a remote name to use a different remote: `git default upstream`.

### `checkout`

Reads the first line piped to it and runs `git checkout` with that value.
