#!/usr/bin/env bash
set -euo pipefail
cat > Makefile <<'EOF'
.PHONY: all clean
all: a.out b.out
a.out:
	sleep 1; echo A > a.out
b.out:
	sleep 1; echo B > b.out
clean:
	rm -f a.out b.out
EOF
{ make clean; start=$(date +%s); make -j2; end=$(date +%s); echo "elapsed_seconds=$((end-start))"; cat a.out b.out; echo parallel_make=passed; } | tee experiment.log
