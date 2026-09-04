#!/usr/bin/env bash
set -euo pipefail
chmod +x check.sh
export PYTHONPATH="$PWD/src"
cp src/greetlab/cli.py cli.fixed.py
python3 - <<'PY'
p='src/greetlab/cli.py'; s=open(p).read(); a=s.index('def greeting'); b=s.index('\n\ndef main',a); open(p,'w').write(s[:a]+'def greeting(name: str) -> str:\n    return "Hello, name!"'+s[b:])
PY
/home/dmh/桌面/system-tools-week2/.venv/bin/ruff format src/greetlab/cli.py >/dev/null
set +e; ./check.sh > failure.log 2>&1; code=$?; set -e
mv cli.fixed.py src/greetlab/cli.py
{
echo '=== Q16 STEP 1: intentional regression ==='; cat failure.log; echo "failing_gate_exit=$code"
echo '=== Q16 STEP 2: restore minimal fix and check ==='; make check
echo '=== Q16 STEP 3: build wheel ==='; make build
echo '=== Q16 STEP 4: SHA-256 ==='; sha256sum dist/*.whl
echo 'q16_release_delivery=passed'
} 2>&1 | tee experiment.log
