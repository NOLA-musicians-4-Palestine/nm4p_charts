#!/bin/bash

inotifywait --include .*\.ly$ -m -e close_write "." | 
while read -r directory events filename; do
	folder="pdfs/$filename"

	if [ ! -d "$folder" ]; then
		mkdir -p "$folder"
	fi

	echo "==================================="
	lilypond -o $folder $filename
	echo "==================================="
done

