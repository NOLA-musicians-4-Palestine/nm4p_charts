\version "2.24.1"

% Ya Habibi Koullama (Rahbani Brothers), at concert pitch.
% Melody at the high octave, accompaniment at the mid octave.

yaHabibiStart = {
  \time 3/4
  \set Timing.beamExceptions = #'()
  \tempo \markup { \bold "Ya Habibi Koullama" "– drums start: Darij |DTTDT-|, loop AB" }
}

% The response fills of bars 3, 6 and 12 belong to the accompaniment.
yaHabibiMelodyA = \relative g' {
  g8 d' d4 d |
  c8 d c4 bes |
  c8 d d r r4 |
  g,8 d' d4 f8 es |
  d8 c d c bes4 |
  c8 d d r r4 |
  c8 d es d f es |
  d8 c d c es d |
  c8 bes c bes d c |
  bes8 a bes a c bes |
  d8 c bes a g4 |
  a16 c bes a g4 r |
}

yaHabibiAccompanimentA = \relative bes {
  \repeat unfold 2 { r4 <bes d g> r | }
  r4 <bes d g>8 bes16 a g4 |
  \repeat unfold 2 { r4 <bes d g> r | }
  r4 <bes d g>8 bes16 c d4 |
  \repeat unfold 5 { r4 <bes d g> r | }
  r4 <bes d g> es16 d fis es |
}

yaHabibiMelodyBOne = \relative g' {
  g8 fis g fis es d |
  g8 fis g fis es d |
  fis8 g a8. g16 a g fis es |
  fis8 g a g g fis |
  fis8 es es d d c |
  c8 bes16 c bes a bes8~ bes4 |
}

yaHabibiMelodyBTwo = \relative bes' {
  bes8 es es d d c |
  c8 bes bes a a g |
  g8 g'~ g2 |
  f8 es es d d c |
  c8 bes bes a g4 |
  a16 c bes a g2 |
}

yaHabibiBass = \relative g, { g2 d4 | }

yaHabibiBassLast = \relative g, { g2. | }
