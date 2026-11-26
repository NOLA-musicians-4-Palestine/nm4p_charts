\version "2.24.1"

\include "common.ily"
\include "bahlam-beek.ily"

% First pass at concert pitch, high on the melody. The second pass of A swaps
% high and mid.

scoreHigh = {
  \introStart
  \rehearsal "Intro" "once only; drums hit on 1 and 4"
  \fit \introHigh
  \break
  \melodyStart
  \rehearsal "A" "High on melody, mid on accompaniment; swap 2nd time"
  \lines 2 \fitLow \melodyA
  \break
  \fitLow \melodyB
  \break
  \rehearsal "" "mid calls, high answers; optional: everyone on the last response"
  \fitLow \melodyC
  \break
  \rehearsal "B" "check dynamics: vocals"
  \lines 2 \fitDown \vocalsMelodyA
  \break
  \lines 2 \fitLow \vocalsMelodyB
  \break
  \fit \vocalsC
  \break
  \fit {
    \toChiftitelli
    \finalA
    \lastTime
    \endingHigh
    \endBrackets
  }
  \bar "|."
}

scoreMid = {
  \fit \introMid
  \fit \responsesA
  \fit \responsesB
  \fit \responsesC
  \fit \vocalsResponsesA
  \fit \vocalsResponsesB
  \fit \vocalsC
  \fit {
    \finalA
    \endingHigh
  }
}

scoreBass = {
  \introBass
  \unfoldRepeats \bassA
  \bassB
  \bassC
  \vocalsBassA
  \unfoldRepeats \vocalsBassB
  \vocalsBassC
  \endingBass
  \endingBass
}

\book {
  \bookOutputName #(string-append chartName " - Score")
  \header {
    instrument = "Score"
    meter = #(maqam-markup #{ c #})
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
        \centered "bass" \scoreBass
      }
    >>
    \layout { indent = 12 }
  }
}
