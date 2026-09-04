#!/usr/bin/env bash
set -euo pipefail
RUFF=/home/dmh/桌面/system-tools-week2/.venv/bin/ruff
printf 'def add(a,b):\n return a+b\n' > sample.py
set +e; "$RUFF" format --check sample.py > before.txt 2>&1; before=$?; set -e
"$RUFF" format sample.py > /dev/null; "$RUFF" format --check sample.py > after.txt
{ echo "before_exit=$before"; cat before.txt; echo '--- formatted ---'; cat sample.py; cat after.txt; echo 'format_gate=passed'; } | tee experiment.log
