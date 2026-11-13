\version "2.26.0"
\include "music.ly"

\header {
	instrument = "Saxophone - Combined - Eb"
}
\book{
  \bookOutputSuffix "sax-combined-Bb"
  \score {
	\new Staff \with { instrumentName = "Saxophone" } {
	  \clef "treble"
	  \transpose ef c {
		  \global \new Voice{
			<<
				\SaxMelody
				\SaxHarmony
			>>
		  }
	  }
	}
	\layout { }
  }
  \form
}

\header {
	instrument = "Saxophone - Melody - Eb"
}
\book{
  \bookOutputSuffix "sax-melody-Eb"
  \score {
	\new Staff \with { instrumentName = "Saxophone" } {
	  \clef "treble"
	  \transpose ef c { \global \new Voice \SaxMelody }
	}
	\layout { }
  }
  \form
}

\header {
	instrument = "Saxophone - Harmony - Eb"
}
\book{
  \bookOutputSuffix "sax-harmony-Eb"
  \score {
	\new Staff \with { instrumentName = "Saxophone" } {
	  \clef "treble"
	  \transpose ef c { \global \new Voice \SaxHarmony }
	}
	\layout { }
  }
  \form
}
