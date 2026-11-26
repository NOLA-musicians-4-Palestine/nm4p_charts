\version "2.24.1"

% Bahlam Beek, at concert pitch. Each melody section is written once with its
% responses (lawazim): highs read the melody first and the responses on the
% second pass (A' B' C'), mids the other way round.

introStart = {
  \time 4/4
  \tempo \markup \normal-text \italic "intro once · A, A', B with vocals · Chiftitelli |D--T--T-D---T---| with taqsim · A, A', B with vocals"
}

melodyStart = {
  \tempo \markup { "drums: Maksoum |DT-TD-T-|" }
}

introHigh = \relative c'' {
  r2 r4 c |
  r2 r4 c |
  r2 r4 c |
  r2 r4 c |
}

introMid = \relative g' {
  g8 bes a g bes g r4 |
  g8 bes a g bes g r4 |
  g8 bes a g bes g r4 |
  g8 bes a g bes g r4 |
}

introBass = \relative g, {
  \repeat percent 4 { g8 bes a r bes r r4 | }
}

melodyA = \relative cis' {
  cis8 d e4 e e |
  f8 e f e d2 |
  bes8 cis d4 d d |
  e8 d e d cis2 |
  cis8 d e4 e e |
  f8 e f e d2 |
  bes8 cis d4 d d |
  e8 d e d cis2 |
}

responsesA = \relative d'' {
  R1 |
  r2 r8 d16 c d4 |
  R1 |
  r2 r8 cis16 bes cis4 |
  R1 |
  r2 r8 d16 c d4 |
  R1 |
  r2 r8 cis16 bes cis4 |
}

bassA = \relative cis, {
  \repeat volta 2 {
    cis4 r8 e e4 r |
    f4 r8 e d4 r |
    bes4 r8 d d4 r |
    e4 r8 d cis4 r |
  }
}

melodyB = \relative e' {
  e8 f g a g f e d |
  d8 e f g f e d cis |
  e8 f g a g f e d |
  d8 e f g f e d cis |
}

responsesB = \relative a' {
  r4 r8 a g r f16 e d e |
  d8 r r g f r e16 d cis d |
  cis8 r r a' g r f16 e d e |
  d8 r r g f r e16 d cis d |
}

bassB = \relative e, {
  \repeat percent 2 {
    e8 f g r g f e r |
    d8 e f r f e d r |
  }
}

% Call and response: one part calls the line, the other answers it after
% two bars; everyone may join the last response.
lineC = \relative cis' {
  cis8 d e f g f a e |
  cis8 d cis bes a2 |
}

melodyC = \repeat volta 2 {
  R1 |
  R1 |
  \lineC
}

responsesC = \repeat volta 2 {
  \lineC
  R1 |
  R1 |
}

bassLineC = \relative cis, {
  cis4 r g' r |
  cis,4 r a r |
}

bassC = \repeat volta 2 {
  \repeat percent 2 \bassLineC
}

% The first half of each phrase is the singer alone; the band joins on the second.
vocalsMelodyA = \relative a {
  r8 a4 a8 bes4 d8 cis |
  cis4 bes a r |
  r8 a4 a8 bes4 d8 cis |
  cis4 bes a r |
  r8 a4 a8 bes4 d8 cis |
  cis4 bes a r |
  r8 a4 a8 bes4 d8 cis |
  cis4 bes a r |
}

vocalsResponsesA = \relative a' {
  R1 |
  r2 r4 a8 e' |
  a,8 r r4 r2 |
  r2 r4 a8 e' |
  a,8 r r4 r2 |
  r2 r4 a8 e' |
  a,8 r r4 r2 |
  r2 r4 e' |
}

vocalsBassA = \relative a,, {
  \repeat percent 4 {
    a4 r bes r |
    cis4 r a r |
  }
}

vocalsMelodyB = \relative d' {
  d4 e8 f e4 d |
  f4~ f8 d cis2 |
  cis4 d8 e d4 cis |
  e4~ e8 cis bes2 |
  d4 e8 f e4 d |
  f4~ f8 d cis2 |
  cis4 d8 e d4 cis |
  e4~ e8 cis bes2 |
}

vocalsResponsesB = \relative cis'' {
  R1 |
  r2 r4 cis8 f |
  cis8 r r4 r2 |
  r2 r4 bes8 d |
  d8 r r4 r2 |
  R1 |
  R1 |
  R1 |
}

vocalsBassB = \relative d, {
  \repeat volta 2 {
    d4 r e d |
    f4 r cis r |
    cis4 r d cis |
    e4 r bes r |
  }
}

% Everyone on the line.
vocalsC = \relative bes {
  bes4 cis d e |
  f4 g f8 e d4 |
  a'4 g8 f e d cis bes |
  a4 bes8 cis d4 bes8 a |
}

vocalsBassC = \relative bes,, {
  bes4 cis d e |
  f4 g f d |
  a'4 g e cis |
  a4 bes d bes |
}

% Before Chiftitelli the band stops on the A that starts the ending. Bracketed
% like 1st and 2nd endings, without repeat signs since the form goes back to A.
toChiftitelli = { \set Score.repeatCommands = #'((volta "1st time, to Chiftitelli")) }
lastTime = { \set Score.repeatCommands = #'((volta #f) (volta "last time")) }
endBrackets = { \set Score.repeatCommands = #'((volta #f)) }

finalA = \relative a {
  a4 r r2 |
}

endingHigh = \relative a {
  a8 a'16 g a8 a16 g a8 a16 g a8 a |
}

endingBass = \relative a,, {
  a4 r r2 |
}
