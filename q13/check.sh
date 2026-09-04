#!/usr/bin/env bash
set -euo pipefail
RUFF=${RUFF:-/home/dmh/桌面/system-tools-week2/.venv/bin/ruff}
PYTEST=${PYTEST:-/home/dmh/桌面/system-tools-week3/.venv-dev/bin/pytest}
export PYTHONPATH="$PWD/src"
"$RUFF" format --check .
"$RUFF" check .
"$PYTEST" -q
