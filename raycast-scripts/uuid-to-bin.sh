#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title UUID to BIN
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 💾
# @raycast.packageName Database Utilities
# @raycast.description Convert a UUID to its 32-character binary hex value
# @raycast.argument1 { "type": "text", "placeholder": "UUID (or leave blank for clipboard)", "optional": true }

set -euo pipefail

input="${1:-}"

if [[ -z "${input//[[:space:]]/}" ]]; then
  input="$(pbpaste)"
fi

# Allow a bare UUID, {UUID}, or urn:uuid:UUID, then normalize it.
uuid="$(printf '%s' "$input" | sed -E \
  -e 's/^[[:space:]]+//' \
  -e 's/[[:space:]]+$//' \
  -e 's/^[Uu][Rr][Nn]:[Uu][Uu][Ii][Dd]://' \
  -e 's/^\{//' \
  -e 's/\}$//' | tr '[:upper:]' '[:lower:]')"

if [[ ! "$uuid" =~ ^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$ ]]; then
  echo "Invalid UUID: $input" >&2
  exit 1
fi

result="${uuid//-/}"
printf '%s' "$result" | pbcopy
echo "Copied $result"
