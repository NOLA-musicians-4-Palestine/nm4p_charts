\version "2.26.0"
\include "music.ly"

\header {
  instrument = "Mid Horn - Combined - C"
}
\book{
  \bookOutputSuffix "mid-combined-C"
  \score {
    \new Staff \with { instrumentName = "Mid Horn" } {
      \clef "treble"
      \transpose c c {
        \global \new Voice {
          <<
            \MidMelody
            \MidHarmony
          >>
        }
      }
    }
    \layout { }
  }
  \form
}

\header {
  instrument = "Mid Horn - Melody - C"
}
\book{
  \bookOutputSuffix "mid-melody-C"
  \score {
    \new Staff \with { instrumentName = "Mid Horn" } {
      \clef "treble"
      \transpose c c {
        \global \new Voice { \MidMelody }
      }
    }
    \layout { }
  }
  \form
}

\header {
  instrument = "Mid Horn - Harmony - C"
}
\book{
  \bookOutputSuffix "mid-harmony-C"
  \score {
    \new Staff \with { instrumentName = "Mid Horn" } {
      \clef "treble"
      \transpose c c {
        \global \new Voice { \MidHarmony }
      }
    }
    \layout { }
  }
  \form
}
