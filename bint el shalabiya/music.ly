\version "2.26.0"

\pointAndClickOff
\language "english"


date = #(strftime "%d-%m-%Y" (localtime (current-time)))

\header {
  title = "Bint el Shalabiya"
  subtitle = "For Hanoun Brass Band"
  tagline = \date
  composer = "Fairuz"
}

\bookOutputName "bint-el-shalabiya"

\paper {
  #(set-paper-size "letter")
}

global = {
  \time 4/4
  \key c \minor
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

form = \markup \column {
  \bold Form:
  \line { \bold Intro "(no percussion)"}
  \line { \bold Vamp "(malfuf)"}
  \line { \bold A "(mid melody, malfuf)" }
  \line { \bold A "(high melody, malfuf)" }
  \line { \bold B "(mid melody, karachi, then malfuf)" }
  \line { \bold A "(high melody, malfuf)" }
  \line { \bold Intro "(percussion hits)"}
}

intro = \relative c' {
  \partial 4              c8  d   |
  ef4     f8  g   af4     b8  c   |
  d4      b       r       ef8 d   |
  c4      b8  af  g   f   ef  d   |
  c4      r2. \fine               |
}

vamp = \repeat unfold 3 { r1 }

melodyA = {
  \repeat volta 2
  \relative c' {
    \parenthesize c4^"rest 1st time, play on repeat" g' g g  |
    af8 g   f   af  g2              |
    r4      g       af      c       |
    b4      af8 g   f2              | \break

    r4      af      af      g8  f   |
    g4      f8  ef  g   f   ef  d   |
    c4      d8  ef  f   ef  ef  d   |
    d   c   c   b   c   d   ef  f   | \break

    % tag
    g4      af      af      g8  f   |
    g4      f8  ef  g   f   ef  d   |
    c4      d8  ef  f   ef  ef  d   |
    \alternative {
      \volta 1 {d c c b c4 g'8 ef  |}
      \volta 2 {d c c b c4 c8 d    |}
    }
  }
}

melodyB = \relative c' {
  ef2. b8 c |
  d2. c8 e |
  ef2. d8 ef |
  f2. g4 | \break

  af4. g8 f4 ef |
  g4. f8 ef4 d |
  f4. ef8 d4 c |
  g'2. f4 | \break

  af4. g8 f4 ef |
  g4. f8 ef4 d |
  f4. ef8 d4 c |
  d1 |
}
