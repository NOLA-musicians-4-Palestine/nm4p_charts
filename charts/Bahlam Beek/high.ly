\version "2.24.1"

\include "common.ily"
\include "bahlam-beek.ily"

high = {
  \introStart
  \rehearsal "Intro" "once only; drums hit on 1 and 4"
  \fit \introHigh
  \break
  \melodyStart
  \rehearsal "A" "Melody, 8va when appropriate"
  \lines 2 \fitLow \melodyA
  \break
  \fitLow \melodyB
  \break
  \rehearsal "" "answer the mids' call; optional: everyone on the last response"
  \fitLow \melodyC
  \break
  \rehearsal "A'" "Accompaniment"
  \fit \responsesA
  \break
  \fit \responsesB
  \break
  \rehearsal "" "call, the mids answer; optional: everyone on the last response"
  \fit \responsesC
  \break
  \rehearsal "B Melody" "check dynamics: vocals"
  \lines 2 \fitDown <<
    \vocalsMelodyA
    {
      \textMark \markup \italic "optional: feature one or several players only"
      s1*4
      \textMark \markup \italic "optional: together, octave as felt"
    }
  >>
  \break
  \lines 2 \fitLow <<
    \vocalsMelodyB
    \repeat unfold 2 {
      \textMark \markup \italic "optional: feature"
      s1*2
      \textMark \markup \italic "optional: together"
      s1*2
    }
  >>
  \break
  \fit <<
    \vocalsC
    {
      \textMark \markup \italic "optional: feature or mid only"
      s1*2
      \textMark \markup \italic "optional: octave up"
      s1*2
    }
  >>
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

\part "High C" "treble" c \high
\part "High B♭" "treble" bes \high
\part "High E♭" "treble" es \high
\part "High F" "treble" f \high
