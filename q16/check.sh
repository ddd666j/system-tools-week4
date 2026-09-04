#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="$PWD/src"
/home/dmh/桌面/system-tools-week2/.venv/bin/ruff format --check .
/home/dmh/桌面/system-tools-week2/.venv/bin/ruff check .
/home/dmh/桌面/system-tools-week3/.venv-dev/bin/pytest -q
