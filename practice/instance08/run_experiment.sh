#!/usr/bin/env bash
set -euo pipefail
TOOLS=/home/dmh/.local/week4-tools; export PATH="$TOOLS:$PATH"
export LD_LIBRARY_PATH=/home/dmh/.local/week4-libs${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
cat > packages.json <<'EOF'
[{"name":"a","status":"active","downloads":10},{"name":"b","status":"inactive","downloads":50},{"name":"c","status":"active","downloads":30}]
EOF
jq '{active_count:([.[]|select(.status=="active")]|length),active_downloads:([.[]|select(.status=="active")|.downloads]|add),top:(sort_by(-.downloads)[0].name)}' packages.json | tee experiment.log
