\version "2.24.1"

\include "common.ily"
\include "ya-zarif-atul.ily"
\include "3la-del3ouna.ily"
\include "wein-3a-ramallah.ily"

\header {
  poet = \markup \italic "Features can be a singer."
}

mid = {
  \yaZarifStart
  \rehearsal "Accompaniment" ""
  \fit \yaZarifAccompanimentLow
  \break
  \rehearsal "Melody" "when featured"
  \fit \yaZarifMelody
  \break
  \interludeStart
  \lines 2 \fit \interludeAccompaniment
  \textEndMark \markup \italic "then chants / drum break"
  \break
  \delounaStart
  \rehearsal "Intro" ""
  \fit \delounaIntro
  \break
  \rehearsal "Chorus Accompaniment" ""
  \fit \repeat volta 2 \delounaChorusAccompaniment
  \break
  \rehearsal "Chorus Melody" "when featured"
  \fit \delounaChorus
  \break
  \rehearsal "Verse" ""
  \fit \delounaVerse
  \textEndMark \markup \italic "then chants, or straight on"
  \break
  \weinStart
  \rehearsal "A Accompaniment" ""
  \fit \weinAccompanimentA
  \break
  \rehearsal "B Accompaniment" ""
  \fit \weinAccompanimentB
  \break
  \rehearsal "A Melody" "when featured"
  \fit \weinMelodyA
  \break
  \rehearsal "B Melody" ""
  \fit \weinMelodyB
  \textEndMark \markup \italic "ending: slight slow down"
  \bar "|."
}

\part "Mid C" "bass" c \mid
\part "Mid B♭" "treble" bes \mid
\part "Mid E♭" "treble" es \mid
\part "Mid F" "treble" f \mid
