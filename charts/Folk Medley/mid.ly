\version "2.24.1"

\include "common.ily"
\include "ya-zarif-atul.ily"
\include "3la-del3ouna.ily"
\include "wein-3a-ramallah.ily"

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
  \textEndMark \markup \italic "drum break (open)"
  \break
  \delounaStart
  \rehearsal "Intro" "all, once only"
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
  \textEndMark \markup \italic "loop A B until the ending cue (rit.)"
  \bar "|."
}

\part "Mid C" "bass" c \mid
\part "Mid B♭" "treble" bes \mid
\part "Mid E♭" "treble" es \mid
\part "Mid F" "treble" f \mid
