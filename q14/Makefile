.PHONY: all clean
PYTHON := /home/dmh/.local/bin/python3.12
all: report.txt
stats.txt: data.csv stats.py
	$(PYTHON) stats.py
report.txt: report.md stats.txt build_report.py
	$(PYTHON) build_report.py
clean:
	rm -f stats.txt report.txt
