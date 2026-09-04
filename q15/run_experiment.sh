#!/usr/bin/env bash
set -euo pipefail
TOOLS=/home/dmh/.local/week4-tools
export PATH="$TOOLS:$PATH"
export LD_LIBRARY_PATH=/home/dmh/.local/week4-libs${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
chmod +x api_report.sh
python3 -m http.server 8000 >server.log 2>&1 & server=$!
trap 'kill "$server" 2>/dev/null || true' EXIT
sleep 1
{
echo '=== Q15 STEP 1: curl local API ==='; curl -fsS http://127.0.0.1:8000/packages.json | jq 'length'
echo '=== Q15 STEP 2: jq filter and sort ==='; curl -fsS http://127.0.0.1:8000/packages.json | jq -r '[.[] | select(.status == "active" and .downloads >= 100)] | sort_by([-.downloads, .name]) | .[] | [.name,.version,.downloads] | @tsv'
echo '=== Q15 STEP 3: generate Markdown ==='; ./api_report.sh; cat summary.md
echo 'q15_api_report=passed'
} 2>&1 | tee experiment.log
