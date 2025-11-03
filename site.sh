#!/bin/bash

function new() {
  local title="$1"
  [[ -z "$title" ]] && { echo "Usage: new-post \"Post Title\""; return 1; }
  local slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
  local filename="posts/$(date +%Y%m%d)-${slug}.md"
  hugo new "$filename"
}

if declare -f "$1" > /dev/null 2>&1; then
  "$@"
else
  echo "Function '$1' not found."
  exit 1
fi
