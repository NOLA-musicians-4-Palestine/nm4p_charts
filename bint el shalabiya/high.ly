\version "2.26.0"
\include "music.ly"

\header {
	instrument = "High C"
}

HighPart = \repeat segno 2 {
    \break \section \mark \markup \box \bold Intro
	\intro
    \break \section \mark \markup \box \bold Vamp
	\vamp
    \break \section \mark \markup \box \bold A
	\melodyA
    \break \section \mark \markup \box \bold B
	\melodyB
}

\book{
  \bookOutputSuffix "high-C"
  \score {
	\new Staff \with { instrumentName = "High" } {
	  \clef "treble"
	  \transpose c c {
		  \global \new Voice { \HighPart }
	  }
	}
	\layout { }
  }
  \form
}
