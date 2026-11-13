\version "2.26.0"
\include "music.ly"

\header {
  instrument = "Full Score - C"
}
\book{
  \bookOutputSuffix "score"
  \score {
    \new StaffGroup
    <<
      \new Staff \with { instrumentName = "Trumpet" } {
        \clef "treble"
        \global \new Voice {
          <<
            \TrumpetMelody
            \TrumpetHarmony
          >>
        }
      }

      \new Staff \with { instrumentName = "Sax" } {
        \clef "treble"
        \global \new Voice{
          <<
            \SaxMelody
            \SaxHarmony
          >>
        }
      }

      \new Staff \with { instrumentName = "Mid" }{
        \clef "treble"
        \global \new Voice {
          <<
            \MidMelody
            \MidHarmony
          >>
        }
      }

      \new Staff \with { instrumentName = "Tuba" }{
        \clef "bass"
        \global \new Voice { \Tuba }
      }

    >>
    \layout { }
  }
  \form
}
