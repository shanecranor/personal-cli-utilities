A collection of random scripts and commands to speed up my workflows

## macOS setup

Run `setup/macos/all.sh` to apply system tweaks, install dev tools, and install apps.
You can also run the scripts individually:

- `setup/macos/system-tweaks.sh`
- `setup/macos/install-dev.sh`
- `setup/macos/apps.sh`
- `setup/macos/git-scripts.sh`
- `setup/macos/git-defaults.sh`
- `setup/macos/git-functions.sh`
- `setup/macos/raycast-scripts.sh`

Notes:

- `setup/macos/install-dev.sh` expects Xcode Command Line Tools (triggered by running `git` once).
- `setup/macos/apps.sh` requires Homebrew
- `setup/macos/git-defaults.sh` configures `git branch` to show the most recently committed branches first.
- `setup/macos/install-dev.sh` installs `fzf` when Homebrew is available.
- `setup/macos/git-functions.sh` installs the `gbr` zsh function, which requires `fzf`.

## Git Scripts:

### `git what`

Prints the last n branches that have been checked out in case you forget the names of the branches you were working on in repos with lots of branches. Defaults to the last 5 branches.

### `git default`

Checks out the default branch for `origin`. Pass a remote name to use a different remote: `git default upstream`.
Use `git default --print-only` (or `git default -p`) to print the resolved default branch without changing the current checkout. The flag can be combined with a remote name: `git default --print-only upstream`.

### `checkout`

Reads the first line piped to it and runs `git checkout` with that value.

### `gh pr-context`

Prints stable JSON metadata for a GitHub pull request, including the PR base and head OIDs, the current target-branch OID, and GitHub's changed-file list. Accepts a PR number in the current repository or a PR URL: `gh pr-context 326`.

## Git Functions

### `gbr`

Uses `fzf` to interactively select a local branch, sorted by most recent commit, and switches to it.

## Raycast Scripts

Run `setup/macos/raycast-scripts.sh` to install the commands into `~/raycast_scripts`.

### `UUID to BIN`

Accepts a UUID argument or reads one from the clipboard, converts it to 32 hexadecimal characters, and copies the result. The Raycast window dismisses after the command runs.
