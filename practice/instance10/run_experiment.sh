#!/usr/bin/env bash
set -euo pipefail
cp -r ../../q16 project
cd project; chmod +x check.sh
{ echo '=== release check ==='; make check; echo '=== release build ==='; make build; sha256sum dist/*.whl; echo release_pipeline=passed; } 2>&1 | tee ../experiment.log
cd ..
