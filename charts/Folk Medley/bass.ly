\version "2.24.1"

\include "common.ily"
\include "ya-zarif-atul.ily"
\include "3la-del3ouna.ily"
\include "wein-3a-ramallah.ily"

bass = {
  \yaZarifStart
  \rehearsal "A" "octave as appropriate"
  \noteNamesAbove "part" \yaZarifBass
  \break
  \interludeStart
  \noteNamesAbove "part" \lines 2 \interludeBass
  \textEndMark \markup \italic "then chants / drum break"
  \break
  \delounaStart
  \rehearsal "Intro" ""
  \noteNamesAbove "part" \delounaBassIntro
  \break
  \rehearsal "Chorus" ""
  \noteNamesAbove "part" \delounaBassChorus
  \break
  \rehearsal "Verse" ""
  \noteNamesAbove "part" \delounaBassVerse
  \textEndMark \markup \italic "then chants, or straight on"
  \break
  \weinStart
  \rehearsal "A" ""
  \noteNamesAbove "part" \weinBassA
  \break
  \rehearsal "B" ""
  \noteNamesAbove "part" \weinBassB
  \textEndMark \markup \italic "ending: slight slow down"
  \bar "|."
}

% Bass C reads the line at concert pitch (sounding c' transposes by nothing);
% the treble parts move the whole line, keeping its octave leaps.
\part "Bass C" "bass" c' \bass
\part "Bass E♭" "treble" es \fit \bass
\part "Bass B♭" "treble" bes \fit \bass
