\version "2.24.1"

% Chirak (Armenian folk), at concert pitch, followed by the medley ending.
% Melody and ending at the high octave; each accompaniment voicing as played.

chirakStart = {
  \time 4/4
  \tempo \markup { \bold "Chirak" "– drums: Maksum |D--T--T-|" }
}

chirakMelody = \relative d'' {
  d4.-. d-. d4~ |
  d4 d c bes |
  c4.-. c-. c4~ |
  c4 c bes a |
  d8 f e f d2 |
  r4 d c bes |
  c4.-. c-. c4~ |
  c4 c bes a |
  \repeat unfold 2 {
    bes8 bes r bes c4 a |
    bes8 bes r bes c4 a |
    bes8 bes r bes c4 c8 d |
    bes8 c bes c a4 g |
  }
}

chirakAccompanimentHigh = \relative d' {
  \repeat unfold 7 { r4 d8 d r4 d4 | }
  r2 e8 fis e fis |
  g1 |
  \repeat unfold 2 { r4 g8 g r4 g4 | }
  r2 <e g>8 <fis a> <e g> <fis a> |
  <g bes>1 |
  \repeat unfold 3 { r4 g8 g r4 g4 | }
}

chirakAccompanimentLow = \relative g {
  \repeat unfold 7 { r4 g8 g r4 g4 | }
  r2 e'8 fis e fis |
  g1 |
  r4 g,8 g r4 g4 |
  r4 g8 g r4 g4 |
  r2 e'8 fis e fis |
  g1 |
  r4 g,8 g r4 g4 |
  \repeat unfold 2 { r4 g8 g r4 g4 | }
}

chirakEnding = \relative g'' {
  \repeat unfold 3 { g8 fis g fis g fis g fis | }
  g4 r r2 |
}

% The walk-down in bars 15 and 16 leads into the End, on the last pass only.
chirakBassLoop = \relative g, {
  \repeat percent 14 { g2. d4 | }
  \dashedBracket "ending only" {
    g4 f es d |
    g8 g f f es es d d |
  }
}

chirakBassEnding = \relative g, {
  \repeat percent 3 { g2. d4 | }
  g4 r r2 |
}
