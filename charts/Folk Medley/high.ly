\version "2.24.1"

\include "common.ily"
\include "ya-zarif-atul.ily"
\include "3la-del3ouna.ily"
\include "wein-3a-ramallah.ily"

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
  \textEndMark \markup \italic "drum break (open)"
  \break
  \delounaStart
  \rehearsal "Intro" "all, once only"
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
  \textEndMark \markup \italic "loop A B until the ending cue (rit.)"
  \bar "|."
}

\part "High C" "treble" c \high
\part "High B♭" "treble" bes \high
\part "High E♭" "treble" es \high
