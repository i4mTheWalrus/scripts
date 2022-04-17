#!/usr/bin/bash

# Get the first 3 octets of the network ip
ifconfig | grep "broadcast" | cut -d " " -f 10 | cut -d "." -f 1,2,3 | awk 'FNR == 1' > "/usr/local/bin/octets.txt"

# Set variable to have value of octets.txt
OCTETS=$(cat "/usr/local/bin/octets.txt")
IP_LIST="/usr/local/bin/ip_list.txt"

# Create a new .txt file
echo "" > "$IP_LIST"

# Loop
for ip in {1..254}
do
	ping -c 1 $OCTETS.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> "$IP_LIST" &
done

echo "IP's found:"
cat "$IP_LIST"
echo "Running nmap"

# Perform scan
nmap -sS --top-ports 20 -iL "$IP_LIST"

exit

