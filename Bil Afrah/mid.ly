\version "2.24.1"

\include "common.ily"
\include "ya-habibi-koullama.ily"
\include "chirak.ily"

mid = {
  \yaHabibiStart
  \rehearsal "A Accompaniment" "1st time or when someone else is featured"
  <<
    \lines 2 \fitLow \yaHabibiAccompanimentA
    \chordsAbove "part" \yaHabibiChordsA
  >>
  \break
  \rehearsal "A Melody" "2nd time"
  \lines 2 \fit \yaHabibiMelodyA
  \break
  \rehearsal "B" ""
  \fit \yaHabibiMelodyBOne
  \break
  \fit \yaHabibiMelodyBTwo
  \textEndMark \markup \italic "optional: taksim with drone"
  \break
  \chirakStart
  \rehearsal "Accompaniment" "1st time or when someone else is featured"
  \lines 4 \fit \chirakAccompanimentLow
  \break
  \rehearsal "Melody" "2nd time"
  \lines 4 \fit \chirakMelody
  \break
  \rehearsal "End" "on cue"
  \fit \chirakEnding
  \bar "|."
}

\part "Mid C" "bass" c \mid
\part "Mid B♭" "treble" bes \mid
\part "Mid E♭" "treble" es \mid
\part "Mid F" "treble" f \mid
