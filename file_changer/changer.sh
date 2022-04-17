#!/usr/bin/bash

for file in *.HTM; do
	name=$(basename "$file" .HTM)
# Remove echo to activate this command
	echo mv "$file" "$name.html"
done
