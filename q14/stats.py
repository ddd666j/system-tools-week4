import csv

with open("data.csv") as file:
    total = sum(int(row["value"]) for row in csv.DictReader(file))
with open("stats.txt", "w") as file:
    file.write(str(total))
