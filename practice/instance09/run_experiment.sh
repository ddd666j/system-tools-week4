#!/usr/bin/env bash
set -euo pipefail
cat > cli.py <<'PY'
import argparse,json
p=argparse.ArgumentParser(); p.add_argument('--name',required=True); p.add_argument('--json',action='store_true'); a=p.parse_args(); data={'message':f'Hello, {a.name}!','student':'25020007021'}; print(json.dumps(data) if a.json else data['message'])
PY
TOOLS=/home/dmh/.local/week4-tools; export PATH="$TOOLS:$PATH"
export LD_LIBRARY_PATH=/home/dmh/.local/week4-libs${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
{ /home/dmh/.local/bin/python3.12 cli.py --name Linux; /home/dmh/.local/bin/python3.12 cli.py --name Linux --json | jq -e '.student=="25020007021" and .message=="Hello, Linux!"'; echo cli_json_contract=passed; } | tee experiment.log
