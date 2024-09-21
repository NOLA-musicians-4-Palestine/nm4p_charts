#!/bin/bash

folder_name="pdfs"
if [ ! -d "$folder_name" ]; then
	mkdir -p "$folder_name"
fi

inotifywait --include .*\.ly$ -m -e close_write "." | 
while read -r directory events filename; do
	echo "==================================="
	lilypond -o "pdfs" $filename
	echo "==================================="
done

