#!/usr/bin/bash

# Loop through log files and print top 5 most common messages in each
for logfile in /var/log/*log; do
	echo "Processing: $logfile"
	cut -d ' ' -f5- /var/log/messages | sort | uniq -c | sort -nr | head -5
done
