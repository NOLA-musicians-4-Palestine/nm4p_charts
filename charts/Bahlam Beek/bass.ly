\version "2.24.1"

\include "common.ily"
\include "bahlam-beek.ily"

bass = {
  \introStart
  \rehearsal "Intro" "once only; drums hit on 1 and 4"
  \introBass
  \break
  \melodyStart
  \rehearsal "A" "2x"
  \bassA
  \break
  \bassB
  \break
  \bassC
  \break
  \rehearsal "B" "check dynamics: vocals"
  \vocalsBassA
  \break
  \vocalsBassB
  \break
  \vocalsBassC
  \break
  \rehearsal "" "every time: before Chiftitelli and at the end"
  \endingBass
  \bar "|."
}

% Bass C reads the line at concert pitch (sounding c' transposes by nothing);
% the treble parts move the whole line, keeping its octave leaps.
\part "Bass C" "bass" c' \bass
\part "Bass E♭" "treble" es \fit \bass
\part "Bass B♭" "treble" bes \fit \bass
