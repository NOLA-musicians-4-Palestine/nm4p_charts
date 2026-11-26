\version "2.24.1"

% Ya Zarif A'tul and its interlude, at concert pitch.
% Melody at the high octave; each accompaniment voicing as played.

yaZarifStart = {
  \time 2,2,2 6/4
  \set Timing.beamExceptions = #'()
  \tempo \markup \column {
    \line { \bold "Ya Zarif A'tul" "– drums: Dabke 1 |D--T--T-D--T--T-D---T---|" }
    \line { \normal-text \italic "1st bar rubato as intro · loop melody / accompaniment, features on call · interlude on call" }
  }
}

yaZarifMelody = \relative c' {
  \repeat volta 2 {
    c8 d d d es4 f8 f es es d4 |
    c8 d d d es4 f8 f es es d4 |
    g8 g g g g4 g8 g f f es4 |
    c8 d d d es4 f8 f es es d4 |
  }
}

yaZarifAccompanimentHigh = \relative d' {
  \repeat volta 2 {
    r8. d16 r8 d r8. d16 r8 d r4 f16 g es d |
    r8. d16 r8 d r8. d16 r8 d r4 f16 g a bes |
    r8. g16 r8 g r8. g16 r8 g r4 f16 g es d |
    r8. d16 r8 d r8. d16 r8 d r16 f g es f d es c |
  }
}

yaZarifAccompanimentLow = \relative d {
  \repeat volta 2 {
    r8. d16 r8 d r8. d16 r8 d c4 d |
    r8. d16 r8 d r8. d16 r8 d c4 d8 es16 f |
    g2 r8. g16 r8 g f4 es8 c |
    d2 r8. d16 r8 d c4 d |
  }
}

yaZarifBass = \relative d, {
  \repeat volta 2 {
    d8. d'16~ d4 d,8. d'16~ d4 c d |
    d,8. d'16~ d4 d,8. d'16~ d4 c d |
    g,8. g'16~ g4 g,8. g'16~ g4 f es |
    d,8. d'16~ d4 d,8. d'16~ d4 c d |
  }
}


interludeStart = {
  \time 2/4
  \rehearsal "Interlude" ""
}

interludeMelody = \relative d' {
  \repeat volta 2 {
    d8 es16 c d8 c |
    d8 es16 c d8 c |
    d8 es16 c d8 c |
  }
  \alternative {
    { d8 es f16 g f es | }
    { d8 es f g16 a | }
  }
  g8. f16 g8 f |
  g8. f16 g8 f |
  g8. f16 g8 f |
  g8 a bes16 c bes a |
  g2 |
}

interludeAccompaniment = \relative d' {
  \repeat volta 2 {
    d8 r4 c8 |
    d8 r4 c8 |
    d8 r4 c8 |
  }
  \alternative {
    { d8 r c es | }
    { d8 r4 f,8 | }
  }
  g8 r4 f8 |
  g8 r4 f8 |
  g8 r4 f8 |
  g8 r f a |
  g2 |
}

interludeBass = \relative d, {
  \repeat volta 2 {
    \repeat percent 3 { d4 d | }
  }
  \alternative {
    { d4 c8 es | }
    { d4 d8 f | }
  }
  \repeat percent 4 { g4 g | }
  g2 |
}
