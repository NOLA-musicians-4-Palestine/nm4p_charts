\version "2.26.0"
\include "music.ly"

\header {
	instrument = "Trumpet - Combined - Bb"
}
\book{
  \bookOutputSuffix "trumpet-combined-Bb"
  \score {
	\new Staff \with { instrumentName = "Trumpet" } {
	  \clef "treble"
	  \transpose bf, c {
	  	\global \new Voice {
			<<
				\TrumpetMelody
				\TrumpetHarmony
			>>
		}
	  }
	}
	\layout { }
  }
  \form
}

\header {
	instrument = "Trumpet - Melody - Bb"
}
\book{
  \bookOutputSuffix "trumpet-melody--Bb"
  \score {
	\new Staff \with { instrumentName = "Trumpet" } {
	  \clef "treble"
	  \transpose bf, c { \global \new Voice \TrumpetMelody }
	}
	\layout { }
  }
  \form
}

\header {
	instrument = "Trumpet - Harmony - Bb"
}
\book{
  \bookOutputSuffix "trumpet-harmony--Bb"
  \score {
	\new Staff \with { instrumentName = "Trumpet" } {
	  \clef "treble"
	  \transpose bf, c { \global \new Voice \TrumpetHarmony }
	}
	\layout { }
  }
  \form
}

