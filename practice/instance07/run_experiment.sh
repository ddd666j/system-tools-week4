#!/usr/bin/env bash
set -euo pipefail
TOOLS=/home/dmh/.local/week4-tools; export PATH="$TOOLS:$PATH"
echo '{"ok":true,"student":"25020007021"}' > data.json
python3 -m http.server 8010 > server.log 2>&1 & p=$!; trap 'kill $p 2>/dev/null || true' EXIT; sleep 1
{ curl -fsS http://127.0.0.1:8010/data.json; echo; set +e; curl -fsS http://127.0.0.1:8010/missing.json > /dev/null; c=$?; set -e; echo "missing_exit=$c"; test "$c" -ne 0; echo curl_error_contract=passed; } 2>&1 | tee experiment.log
