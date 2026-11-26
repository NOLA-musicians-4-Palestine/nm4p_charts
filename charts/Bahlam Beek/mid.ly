\version "2.24.1"

\include "common.ily"
\include "bahlam-beek.ily"

mid = {
  \introStart
  \rehearsal "Intro" "once only; drums hit on 1 and 4"
  \fit \introMid
  \break
  \melodyStart
  \rehearsal "A" "Accompaniment"
  \fit \responsesA
  \break
  \fit \responsesB
  \break
  \rehearsal "" "call, the highs answer; optional: everyone on the last response"
  \fit \responsesC
  \break
  \rehearsal "A'" "Melody, 8va when appropriate"
  \lines 2 \fit \melodyA
  \break
  \fit \melodyB
  \break
  \rehearsal "" "answer the highs' call; optional: everyone on the last response"
  \fit \melodyC
  \break
  \rehearsal "B Accompaniment" "check dynamics: vocals"
  \fit \vocalsResponsesA
  \break
  \fit \vocalsResponsesB
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

\part "Mid C" "bass" c \mid
\part "Mid B♭" "treble" bes \mid
\part "Mid E♭" "treble" es \mid
\part "Mid F" "treble" f \mid
