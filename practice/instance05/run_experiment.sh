#!/usr/bin/env bash
set -euo pipefail
cat > Makefile <<'EOF'
.PHONY: all
all: report.txt
stats.txt: data.txt
	wc -l data.txt > stats.txt
report.txt: title.txt stats.txt
	cat title.txt stats.txt > report.txt
EOF
printf 'a\nb\nc\n' > data.txt; echo REPORT > title.txt
{ echo '=== dry run ==='; make -n; echo '=== build ==='; make; echo '=== up to date ==='; make -n; cat report.txt; } | tee experiment.log
