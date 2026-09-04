#!/usr/bin/env bash
set -euo pipefail
{
echo '=== Q14 STEP 1: clean and first make ==='; make clean; make
echo 'products:'; cat stats.txt; cat report.txt
echo '=== Q14 STEP 2: second make ==='; make
echo '=== Q14 STEP 3: touch data.csv and make ==='; sleep 1; touch data.csv; make
echo '=== Q14 STEP 4: dependency timestamps ==='; stat -c '%y %n' data.csv stats.txt report.txt
echo '=== Q14 STEP 5: clean only generated files ==='; make clean; test -f data.csv; test ! -e stats.txt; test ! -e report.txt
echo 'q14_incremental_build=passed'
} 2>&1 | tee experiment.log
