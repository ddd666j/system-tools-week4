#!/usr/bin/env bash
set -euo pipefail
cat > source.txt <<EOF
alpha
EOF
cat > Makefile <<'EOF'
.PHONY: all clean
all: upper.txt
upper.txt: source.txt
	tr a-z A-Z < source.txt > upper.txt
clean:
	rm -f upper.txt
EOF
{ make clean; echo FIRST; make; echo SECOND; make; sleep 1; touch source.txt; echo AFTER_TOUCH; make; cat upper.txt; } 2>&1 | tee experiment.log
