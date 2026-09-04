#!/usr/bin/env bash
set -euo pipefail
RUFF=/home/dmh/桌面/system-tools-week2/.venv/bin/ruff
printf 'import os\n\nprint("quality")\n' > app.py
set +e; "$RUFF" check app.py > before.txt 2>&1; before=$?; set -e
"$RUFF" check --fix app.py > /dev/null
{ echo "before_exit=$before"; cat before.txt; echo '--- fixed ---'; cat app.py; "$RUFF" check app.py; echo 'lint_gate=passed'; } | tee experiment.log
