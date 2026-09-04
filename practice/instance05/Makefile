.PHONY: all
all: report.txt
stats.txt: data.txt
	wc -l data.txt > stats.txt
report.txt: title.txt stats.txt
	cat title.txt stats.txt > report.txt
