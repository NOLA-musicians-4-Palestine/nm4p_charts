#!/bin/bash
# Rebuilds every .ly of a chart folder (default: the current one) on start and
# on each save of a .ly or .ily there or in lib/.
#
# Needs fswatch (macOS: brew install fswatch) or inotifywait (Linux: inotify-tools).

lib="$(cd "$(dirname "$0")" && pwd)"
cd "${1:-.}" || exit 1

build() {
  for file in *.ly; do
    lilypond --loglevel=WARNING "$file"
  done
  echo "=== rebuilt at $(date +%T)"
}

changes() {
  if command -v fswatch >/dev/null; then
    fswatch -E -e '.*' -i '\.i?ly$' . "$lib"
  else
    inotifywait -m -q -e close_write,moved_to --include '\.(ly|ily)$' . "$lib"
  fi
}

build
changes |
  while read -r _; do
    # Editors and the formatter save in bursts: wait for quiet, then build once.
    while read -r -t 0.5 _; do :; done
    build
  done
