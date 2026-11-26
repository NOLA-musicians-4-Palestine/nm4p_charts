\version "2.24.1"

% 3la Del3ouna, at concert pitch. Melody at the high octave.

delounaStart = {
  \time 2,2,2 6/4
  \set Timing.beamExceptions = #'()
  \tempo \markup \column {
    \line { \bold "3la Del3ouna" "– drums: intro stops on the 1 of each bar, then Dabke 2 |D-TTT-D-D-TTT-D-D---T---|" }
    \line { \normal-text \italic "intro once, together · loop chorus (melody / accompaniment, features on call) and verse (together)" }
  }
}

delounaIntro = \relative c' {
  \repeat volta 2 {
    c8 d d d c d d c d4 d |
    r8 a'16 g f8 g16 f es8 f16 es d8 c d4 d |
  }
}

delounaChorus = \relative d' {
  \repeat volta 2 {
    d8 es f g g g g g f4 es |
    es8 f g f16 es d8 g g es f8. es16 d4 |
  }
}

delounaVerse = \relative d' {
  \repeat volta 2 {
    d8 a' a a d, a' a g f4 g |
    f8 g g f16 es d8 g g es f8. es16 d4 |
  }
}

% One bar, looped under the chorus; everyone plays the verse.
delounaChorusAccompaniment = \relative d {
  r8 d16 d d8 r r d16 d d8 r r d16 d d8 r |
}

delounaBassIntro = \relative d, {
  \repeat volta 2 {
    d2~ d4. c'8 d4 d |
    d,2~ d4. c'8 d4 d |
  }
}

delounaBassChorus = \relative d, {
  \repeat volta 2 {
    d4. d8 d4. d8 d4. d8 |
    c4. c8 c4. c8 d4. c8 |
  }
}

delounaBassVerse = \relative d, {
  \repeat volta 2 {
    d4. c8 d4. d8 f4 g |
    d4. c8 d4. d8 c4 d |
  }
}
