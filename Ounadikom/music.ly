\version "2.26.0"

\pointAndClickOff
\language "english"


date = #(strftime "%d-%m-%Y" (localtime (current-time)))

\header {
  title = "Ounadikom"
  subtitle = "For Hanoun Brass Band"
  tagline = \date
  composer = "Ahmad Kaabour"
}

\bookOutputName "ounadikom"

\paper {
  #(set-paper-size "letter")
}

global = {
  \time 2/4
  \key a \minor
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
}

form = \markup \column {
  \bold Form:
  \line { \bold Intro }
  \line { \bold "Chorus x2" "(Malfuf, Trombone Lawazim)" }
  \line { \bold "Bridge x2" "(Dabke, Call+Response)" }
  \line { \bold C "(Baladi/Stops, Features)" }
  \line { \bold "Bridge" "(Dabke, Call+Response)" }
  \line { \bold C "(Baladi/Stops, Features)" }
  \line { "Repeat (without intro)" }
  \line { \bold End "2 bar drum break, all hit Cm on down beat of 3rd bar" }
}

restsA = {
  \repeat volta 2
  \repeat unfold 4 r2.
}

melodyA = {
  \repeat volta 2
  \relative c''{
    c8	g	c	ef	ef4	|
    g8	af	g	ef	ef4	|
    c8	g	c	ef	ef4	|
    g8	af	g	ef4.	|
  }
}
harmonyA = {
  \repeat volta 2
  \relative c''{
    g8	ef	g	c	c4	|
    ef8	f	ef	c	c4	|
    g8	ef	g	c	c4	|
    ef8	f	ef	c4.		|
  }
}

bassA = {
  \repeat volta 2
  \repeat unfold 4
  \relative c, {
    c8	r4	g'8	r4 |
  }
}

restsB = {
  \repeat volta 2
  \repeat unfold 6 r2.
}

melodyB = {
  \repeat volta 2
  \relative bf'' {
    bf8	af	af	bf	af	af	|
    bf	af	af	af	bf	bf	|
    bf	af	r	f	f	r	|

    af	f	f	f	f	f	|
    f	af	r	c,	c	c	|
    c	c	r	ef	ef	r	|
  }
}

harmonyB = {
  \repeat volta 2
  \relative g'' {
    g8	f	f	g	f	f	|
    g	f	f	f	g	g	|
    g	f	r	c	c	r	|

    f	c	c	c	c	c	|
    c	f	r	g,	g	g	|
    g	g	r	c	c	r	|
  }
}

accompB = {
  \repeat volta 2
  \relative f'' {
    \repeat unfold 5 {	r8	f16		f	r8	r	af	r	| }
    r8	c,16	c	r8	r	ef	r	|
  }
}

accompHarmonyB = {
  \repeat volta 2
  \relative f'' {
    \repeat unfold 5 {	r8	c16		c	r8	r	f	r	| }
    r8	g,16	g	r8	r	c	r	|
  }
}

bassB = {
  \repeat volta 2{
    \repeat unfold 5 \relative f, 	{ f8	r4	c'8	r4 | }
    \relative c, 					{ c8	r4	g'8	r4 | }
  }
}

melodyBPrime = {
  \repeat volta 2
  \relative bf'' {
    bf8	af	af	bf	af	af	|
    bf	af	r	af	bf	bf	|
    bf	af	r	f	f	r	|

    af	f	f	f	f	f	|
    f	af	r	c,	c	c	|
    c	c	r	ef	ef	r	|
  }
}

harmonyBPrime = {
  \repeat volta 2
  \relative g'' {
    g8	f	f	g	f	f	|
    g	f	r	f	g	g	|
    g	f	r	c	c	r	|

    f	c	c	c	c	c	|
    c	f	r	g,	g	g	|
    g	g	r	c	c	r	|
  }
}

melodyC = {
  \repeat volta 2
  \relative f'' {
    f8	f	ef	f	f	ef	|
    f	ef	r	ef	f	f	|
    f	ef	r	c	c	r	|

    ef	ef	f	af	f	f	|
    f	ef	r	ef	f	f	|
    f	ef	r	c	c	r	|
  }
}

harmonyC = {
  \repeat volta 2
  \relative c'' {
    c8	c	c	c	c	c	|
    c	c	r	c	c	c	|
    c	c	r	af	af	r	|

    c	c	c	ef	c	c	|
    c	c	r	c	c	c	|
    c	c	r	af	af	r	|
  }
}

accompC = {
  \repeat volta 2
  \relative c'' {
    \repeat unfold 6 {	r8	c16		c	r8	r	c	r	| }
  }
}

accompHarmonyC = {
  \repeat volta 2
  \relative af' {
    \repeat unfold 6 {	r8	af16	af	r8	r	af	r	| }
  }
}

bassC = {
  \repeat volta 2{
    \repeat unfold 6 \relative af, 	{ af8	r4	ef8	r4 | }
  }
}

restsC = {
  \repeat volta 2 {
    \repeat unfold 6  { r2. | }
  }
}


melodyD = {
  \repeat volta 2
  \relative bf'' {
    c8	bf	af	bf	bf	af	|
    bf	af	r	af	bf	bf	|
    bf	af	r	f	f	r	|

    af	f	f	f	f	f	|
    f	af	r	c,	c	c	|
    c	c	r	ef	ef	r	|
  }
}

harmonyD = {
  \repeat volta 2
  \relative g'' {
    g8	g	f	g	g	f	|
    g	f	r	f	g	g	|
    g	f	r	c	c	r	|

    f	c	c	c	c	c	|
    c	f	r	g,	g	g	|
    g	g	r	c	c	r	|
  }
}

bassD = \bassB

restsD = \restsB

%------------------------ Assemble -----------------------------

%-------- Trumpets ---------

TrumpetMelody =  {
  \break \section \mark \markup \box \bold A
  \restsA

  \break \section \mark \markup \box \bold B
  \melodyB

  \break \section \mark \markup \box \bold B'
  \restsB

  \break \section \mark \markup \box \bold C
  \melodyC

  \break \section \mark \markup \box \bold D
  \restsD
}

TrumpetHarmony =  {
  \break \section \mark \markup \box \bold A
  \restsA

  \break \section \mark \markup \box \bold B
  \harmonyB

  \break \section \mark \markup \box \bold B'
  \restsB

  \break \section \mark \markup \box \bold C
  \harmonyC

  \break \section \mark \markup \box \bold D
  \restsD
}

%-------- Saxes ---------

SaxMelody =  {
  \break \section \mark \markup \box \bold A
  \restsA

  \break \section \mark \markup \box \bold B
  \restsB

  \break \section \mark \markup \box \bold B'
  \melodyBPrime

  \break \section \mark \markup \box \bold C
  \restsC

  \break \section \mark \markup \box \bold D
  \melodyD
}

SaxHarmony =  {
  \break \section \mark \markup \box \bold A
  \restsA

  \break \section \mark \markup \box \bold B
  \restsB

  \break \section \mark \markup \box \bold B'
  \harmonyBPrime

  \break \section \mark \markup \box \bold C
  \restsC

  \break \section \mark \markup \box \bold D
  \harmonyD
}

%-------- Mids ---------

MidMelody = {
  \break \section \mark \markup \box \bold A
  \melodyA

  \break \section \mark \markup \box \bold B
  \accompB

  \break \section \mark \markup \box \bold B'
  \restsB

  \break \section \mark \markup \box \bold C
  \accompC

  \break \section \mark \markup \box \bold D
  \restsD
}

MidHarmony = {
  \break \section \mark \markup \box \bold A
  \harmonyA

  \break \section \mark \markup \box \bold B
  \accompHarmonyB

  \break \section \mark \markup \box \bold B'
  \restsB

  \break \section \mark \markup \box \bold C
  \accompHarmonyC

  \break \section \mark \markup \box \bold D
  \restsD
}


%-------- Tuba ---------

Tuba = {
  \break \section \mark \markup \box \bold A
  \bassA

  \break \section \mark \markup \box \bold B
  \bassB

  \break \section \mark \markup \box \bold B'
  \bassB

  \break \section \mark \markup \box \bold C
  \bassC

  \break \section \mark \markup \box \bold D
  \bassD
}
