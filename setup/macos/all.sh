#!/usr/bin/env bash
set -euo pipefail

# calls all individual setup scripts for macos
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
"$SCRIPT_DIR/system-tweaks.sh"
"$SCRIPT_DIR/install-dev.sh"
"$SCRIPT_DIR/apps.sh"
