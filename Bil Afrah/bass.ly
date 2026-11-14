\version "2.24.1"

\include "common.ily"
\include "ya-habibi-koullama.ily"
\include "chirak.ily"

bass = {
  \yaHabibiStart
  \rehearsal "A" "vary chord tones as felt"
  <<
    \lines 2 \yaHabibiBassA
    \chordsAbove "part" \yaHabibiBassChordsA
  >>
  \break
  \rehearsal "B" ""
  \lines 2 \yaHabibiBassB
  \textEndMark \markup \italic "optional: taksim with drone"
  \break
  \chirakStart
  \rehearsal "" ""
  \lines 4 \chirakBassLoop
  \break
  \rehearsal "End" "on cue"
  \chirakBassEnding
  \bar "|."
}

\part "Bass C" "bass" c \fitLow \bass
\part "Bass E♭" "treble" es \fitLow \bass
\part "Bass B♭" "treble" bes \fitLow \bass
