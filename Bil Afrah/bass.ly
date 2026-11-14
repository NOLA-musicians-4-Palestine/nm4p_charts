\version "2.24.1"

\include "common.ily"
\include "ya-habibi-koullama.ily"
\include "chirak.ily"

bass = {
  \yaHabibiStart
  \rehearsal "A" ""
  \lines 2 \repeat percent 12 \yaHabibiBass
  \break
  \rehearsal "B" ""
  <<
    { \repeat percent 11 \yaHabibiBass }
    { s2.*6 \break }
  >>
  \yaHabibiBassLast
  \textEndMark \markup \italic "optional: taksim with drone"
  \break
  \chirakStart
  \rehearsal "" ""
  \lines 4 \repeat percent 16 \chirakBass
  \break
  \rehearsal "End" "on cue"
  \chirakBassEnding
  \bar "|."
}

\part "Bass C" "bass" c \fit \bass
\part "Bass E♭" "treble" es \fit \bass
\part "Bass B♭" "treble" bes \fit \bass
