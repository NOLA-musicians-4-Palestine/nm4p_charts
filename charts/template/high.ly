\version "2.24.1"

\include "common.ily"
\include "tune.ily"

high = {
  \tuneStart
  \rehearsal "A" "melody"
  <<
    \lines 2 \fit \tuneMelody
    \chordsAbove "part" \tuneChords
  >>
  \bar "|."
}

\part "High C" "treble" c \high
\part "High B♭" "treble" bes \high
