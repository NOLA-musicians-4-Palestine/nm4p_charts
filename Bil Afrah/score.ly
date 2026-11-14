\version "2.24.1"

\include "common.ily"
\include "ya-habibi-koullama.ily"
\include "chirak.ily"

% First pass of the form at concert pitch: high on the melody, mid on the
% accompaniment. The role swaps are in the labels.

scoreHigh = {
  \yaHabibiStart
  \rehearsal "A" "High on melody, mid on accompaniment; swap 2nd time"
  \lines 2 \fit \yaHabibiMelodyA
  \break
  \rehearsal "B" ""
  \fit \yaHabibiMelodyBOne
  \break
  \fit \yaHabibiMelodyBTwo
  \textEndMark \markup \italic "optional: taksim with drone"
  \break
  \chirakStart
  \rehearsal "" "High on melody, mid on accompaniment; swap 2nd time"
  \lines 4 \fit \chirakMelody
  \break
  \rehearsal "End" "on cue"
  \fit \chirakEnding
  \bar "|."
}

scoreMid = {
  \fitLow \yaHabibiAccompanimentA
  \fit \yaHabibiMelodyBOne
  \fit \yaHabibiMelodyBTwo
  \fit \chirakAccompanimentLow
  \fit \chirakEnding
}

scoreBass = {
  \repeat percent 12 \yaHabibiBass
  \repeat percent 11 \yaHabibiBass
  \yaHabibiBassLast
  \repeat percent 16 \chirakBass
  \chirakBassEnding
}

\book {
  \paper { page-count = 2 }
  \bookOutputName "Bil Afrah - Score"
  \header {
    instrument = "Score"
    meter = \markup { "Maqam" #maqam "on G" }
  }
  \score {
    <<
      \new Staff \with { instrumentName = "High" } {
        \clef "treble"
        \autoLineBreaksOff
        \centered "treble" \scoreHigh
      }
      \new Staff \with { instrumentName = "Mid" } {
        \clef "bass"
        \centered "bass" \scoreMid
      }
      \new Staff \with { instrumentName = "Bass" } {
        \clef "bass"
        \centered "bass" \fit \scoreBass
      }
    >>
    \layout { indent = 12 }
  }
}
