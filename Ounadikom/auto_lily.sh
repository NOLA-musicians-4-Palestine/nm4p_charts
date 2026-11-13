#!/bin/bash

inotifywait --include .*\.ly$ -m -e close_write "." | 
while read -r directory events filename; do
	echo "==================================="
	find -type f -name "*.ly" \
		-exec lilypond -o "pdfs" {} \;
	echo "==================================="
done

