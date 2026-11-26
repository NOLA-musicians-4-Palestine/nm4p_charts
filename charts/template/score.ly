\version "2.24.1"

\include "common.ily"
\include "tune.ily"

\book {
  \bookOutputName #(string-append chartName " - Score")
  \header {
    instrument = "Score"
    meter = #(maqam-markup #{ c #})
  }
  \score {
    <<
      \new Staff = "high" \with { instrumentName = "High" } {
        \clef "treble"
        \tuneStart
        <<
          \centered "treble" \fit \tuneMelody
          \chordsAbove "high" \tuneChords
        >>
        \bar "|."
      }
      \new Staff \with { instrumentName = "Bass" } {
        \clef "bass"
        \centered "bass" \fitLow \tuneBass
      }
    >>
    \layout { indent = 12 }
  }
}
