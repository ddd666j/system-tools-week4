#!/usr/bin/env bash
set -euo pipefail
export LD_LIBRARY_PATH=/home/dmh/.local/week4-libs${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
CURL=${CURL:-curl}
JQ=${JQ:-jq}
url=${1:-http://127.0.0.1:8000/packages.json}
tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT
"$CURL" -fsS "$url" > "$tmp"
{
echo '# Active Packages'
echo
echo '| name | version | downloads |'
echo '|---|---|---:|'
"$JQ" -r '[.[] | select(.status == "active" and .downloads >= 100)] | sort_by([-.downloads, .name])[] | "| \(.name) | \(.version) | \(.downloads) |"' "$tmp"
} > summary.md
