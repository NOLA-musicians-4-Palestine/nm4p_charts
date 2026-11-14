#!/bin/bash
# Rebuilds every Bil Afrah PDF on start and on each save of a .ly or .ily here.
#
# Every file includes the shared ones, so any change rebuilds all of them.

cd "$(dirname "$0")" || exit 1

build() {
  for file in high mid bass score; do
    lilypond --loglevel=WARNING "$file.ly"
  done
  echo "=== rebuilt at $(date +%T)"
}

build
inotifywait -m -q -e close_write,moved_to --include '\.(ly|ily)$' . |
  while read -r _; do
    # Editors and the formatter save in bursts: wait for quiet, then build once.
    while read -r -t 0.5 _; do :; done
    build
  done
