\version "2.24.1"

% Wein 3a Ramallah, at concert pitch.
% Melody at the high octave, accompaniment at the mid octave.

weinStart = {
  \time 2/4
  \tempo \markup \column {
    \line { \bold "Wein 3a Ramallah" "– drums: Malfuf |D--T--T-|" }
    \line { \normal-text \italic "loop A B, optional feature on call" }
  }
}

weinMelodyA = \relative f' {
  \repeat volta 2 {
    f4 es8 c |
    d4 d |
    f4 es8 c |
    d8 es f g |
    g8 f g es |
    f4 es8 c |
  }
  \alternative {
    { d4 d | }
    { d4 d | }
  }
}

weinMelodyB = \relative g' {
  \repeat volta 2 {
    g4 g8 g |
    f8 es d16 bes' a bes |
    g4 g8 g |
    f8 es d es16 f |
    g8 f g es |
    f4 es8 c |
    d4 d |
  }
}

% The fills answer the held notes of the melody.
weinAccompanimentA = \relative c {
  \repeat volta 2 {
    R2 |
    r8. c16 d8 c |
    R2 |
    d8 es f g~ |
    g2 |
    R2 |
  }
  \alternative {
    { r8. c,16 d8 c | }
    { r4 d8 es16 f | }
  }
}

weinAccompanimentB = \relative g {
  \repeat volta 2 {
    g2 |
    f8 es d4 |
    g2 |
    f8 es d4 |
    g8 f g es |
    f4 es8 c |
    d4 d |
  }
}

weinBassA = \relative d, {
  \repeat volta 2 {
    \repeat percent 4 { d8. d'8 r16 d8 | }
    g,8. g'8 r16 g8 |
    f,4 es |
  }
  \alternative {
    { d8. d'8 r16 d8 | }
    { d,8. d'8 r16 d8 | }
  }
}

weinBassB = \relative g, {
  \repeat volta 2 {
    \repeat percent 5 { g8. g'8 r16 g8 | }
    f,4 es |
    d8. d'8 r16 d8 |
  }
}
