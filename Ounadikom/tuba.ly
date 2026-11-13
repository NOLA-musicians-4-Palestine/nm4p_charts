\version "2.26.0"
\include "music.ly"

\header {
  instrument = "Tuba - Bass Clef"
}
\book{
  \bookOutputSuffix "tuba-bass-clef"
  \score {
    \new Staff \with { instrumentName = "Tuba" } {
      \clef "bass"
      \transpose c c {
        \global \new Voice { \Tuba }
      }
    }
    \layout { }
  }
  \form
}

\header {
  instrument = "Tuba - Eb"
}
\book{
  \bookOutputSuffix "tuba-Eb"
  \score {
    \new Staff \with { instrumentName = "Tuba" } {
      \clef "treble"
      \transpose ef c'' {
        \global \new Voice { \Tuba }
      }
    }
    \layout { }
  }
  \form
}
