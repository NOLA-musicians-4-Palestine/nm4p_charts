\version "2.24.1"

\include "common.ily"
\include "ya-zarif-atul.ily"
\include "3la-del3ouna.ily"
\include "wein-3a-ramallah.ily"

\header {
  poet = \markup \italic "Features can be a singer."
}

high = {
  \yaZarifStart
  \rehearsal "Melody" ""
  \fit \yaZarifMelody
  \break
  \rehearsal "Accompaniment" "when someone else is featured"
  \fit \yaZarifAccompanimentHigh
  \break
  \interludeStart
  \lines 2 \fit \interludeMelody
  \textEndMark \markup \italic "then chants / drum break"
  \break
  \delounaStart
  \rehearsal "Intro" ""
  \fit \delounaIntro
  \break
  \rehearsal "Chorus Melody" ""
  \fit \delounaChorus
  \break
  \rehearsal "Chorus Accompaniment" "when someone else is featured"
  \fitDown \repeat volta 2 \delounaChorusAccompaniment
  \break
  \rehearsal "Verse" ""
  \fit \delounaVerse
  \textEndMark \markup \italic "then chants, or straight on"
  \break
  \weinStart
  \rehearsal "A Melody" ""
  \fit \weinMelodyA
  \break
  \rehearsal "B Melody" ""
  \fit \weinMelodyB
  \break
  \rehearsal "A Accompaniment" "when someone else is featured"
  \fit \weinAccompanimentA
  \break
  \rehearsal "B Accompaniment" ""
  \fit \weinAccompanimentB
  \textEndMark \markup \italic "ending: slight slow down"
  \bar "|."
}

\part "High C" "treble" c \high
\part "High B♭" "treble" bes \high
\part "High E♭" "treble" es \high
