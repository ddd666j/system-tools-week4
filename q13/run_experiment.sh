#!/usr/bin/env bash
set -euo pipefail
chmod +x check.sh
RUFF=/home/dmh/桌面/system-tools-week2/.venv/bin/ruff
export PYTHONPATH="$PWD/src"
{
echo '=== Q13 STEP 1: ruff format ==='; "$RUFF" format .
echo '=== Q13 STEP 2: ruff check ==='; "$RUFF" check .
echo '=== Q13 STEP 3: pytest ==='; /home/dmh/桌面/system-tools-week3/.venv-dev/bin/pytest -q
echo '=== Q13 STEP 4: local quality gate ==='; ./check.sh
echo 'q13_quality_gate=passed exit=0'
} 2>&1 | tee experiment.log
