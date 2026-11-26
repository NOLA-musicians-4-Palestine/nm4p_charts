\version "2.24.1"

% Song material at concert pitch.

tuneStart = {
  \time 4/4
  \tempo "Tune"
}

tuneMelody = \relative g' {
  g4 a bes c |
  d2 c |
  bes4 a g a |
  g1 |
}

tuneChords = \chordmode {
  g1:m
  s1
  \optionalChord c1:m
  s1
}

tuneBass = \relative g, {
  \repeat percent 4 { g2. d4 | }
}
