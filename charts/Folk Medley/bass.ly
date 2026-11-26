\version "2.24.1"

\include "common.ily"
\include "ya-zarif-atul.ily"
\include "3la-del3ouna.ily"
\include "wein-3a-ramallah.ily"

bass = {
  \yaZarifStart
  \rehearsal "A" "octave as appropriate"
  \noteNamesAbove "part" \fit \yaZarifBass
  \break
  \interludeStart
  \noteNamesAbove "part" \lines 2 \fit \interludeBass
  \textEndMark \markup \italic "then chants / drum break"
  \break
  \delounaStart
  \rehearsal "Intro" ""
  \noteNamesAbove "part" \fit \delounaBassIntro
  \break
  \rehearsal "Chorus" ""
  \noteNamesAbove "part" \fit \delounaBassChorus
  \break
  \rehearsal "Verse" ""
  \noteNamesAbove "part" \fit \delounaBassVerse
  \textEndMark \markup \italic "then chants, or straight on"
  \break
  \weinStart
  \rehearsal "A" ""
  \noteNamesAbove "part" \fit \weinBassA
  \break
  \rehearsal "B" ""
  \noteNamesAbove "part" \fit \weinBassB
  \textEndMark \markup \italic "ending: slight slow down"
  \bar "|."
}

\part "Bass C" "bass" c \bass
\part "Bass E♭" "treble" es \bass
\part "Bass B♭" "treble" bes \bass
