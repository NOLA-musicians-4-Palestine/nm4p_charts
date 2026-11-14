\version "2.24.1"

\include "common.ily"
\include "ya-habibi-koullama.ily"
\include "chirak.ily"

high = {
  \yaHabibiStart
  \rehearsal "A Melody" "1st time"
  \lines 2 \fit \yaHabibiMelodyA
  \break
  \rehearsal "A Accompaniment" "2nd time or when someone else is featured"
  \lines 2 \fit \yaHabibiAccompanimentA
  \break
  \rehearsal "B Melody" "all"
  \fit \yaHabibiMelodyBOne
  \break
  \fit \yaHabibiMelodyBTwo
  \textEndMark \markup \italic "optional: taksim with drone"
  \break
  \chirakStart
  \rehearsal "Melody" "1st time"
  \lines 4 \fit \chirakMelody
  \break
  \rehearsal "Accompaniment" "2nd time or when someone else is featured"
  \lines 4 \fit \chirakAccompanimentHigh
  \break
  \rehearsal "End" "on cue"
  \fit \chirakEnding
  \bar "|."
}

\part "High C" "treble" c \high
\part "High B♭" "treble" bes \high
\part "High E♭" "treble" es \high
