\version "2.24.1"

\include "common.ily"
\include "ya-zarif-atul.ily"
\include "3la-del3ouna.ily"
\include "wein-3a-ramallah.ily"

% First pass of the form at concert pitch: high on the melody, mid on the
% accompaniment. The role swaps are in the labels.

scoreHigh = {
  \yaZarifStart
  \rehearsal "Ya Zarif A'tul" "High on melody, mid on accompaniment; swap 2nd time"
  \fit \yaZarifMelody
  \break
  \interludeStart
  \lines 2 \fit \interludeMelody
  \textEndMark \markup \italic "then chants / drum break"
  \break
  \delounaStart
  \rehearsal "Intro" ""
  \fit \delounaIntro
  \break
  \rehearsal "Chorus" "High on melody, mid on accompaniment; swap 2nd time"
  \fit \delounaChorus
  \break
  \rehearsal "Verse" ""
  \fit \delounaVerse
  \textEndMark \markup \italic "then chants, or straight on"
  \break
  \weinStart
  \rehearsal "A" "High on melody, mid on accompaniment; swap 2nd time"
  \fit \weinMelodyA
  \break
  \rehearsal "B" ""
  \fit \weinMelodyB
  \textEndMark \markup \italic "ending: slight slow down"
  \bar "|."
}

scoreMid = {
  \fit \yaZarifAccompanimentLow
  \fit \interludeAccompaniment
  \fit \delounaIntro
  \fit \repeat volta 2 {
    \delounaChorusAccompaniment
    \delounaChorusAccompaniment
  }
  \fit \delounaVerse
  \fit \weinAccompanimentA
  \fit \weinAccompanimentB
}

scoreBass = {
  \yaZarifBass
  \interludeBass
  \delounaBassIntro
  \delounaBassChorus
  \delounaBassVerse
  \weinBassA
  \weinBassB
}

\book {
  \bookOutputName #(string-append chartName " - Score")
  \header {
    instrument = "Score"
    meter = #(maqam-markup #{ c #})
  }
  \score {
    <<
      \new Staff \with { instrumentName = "High" } {
        \clef "treble"
        \autoLineBreaksOff
        \centered "treble" \scoreHigh
      }
      \new Staff \with { instrumentName = "Mid" } {
        \clef "bass"
        \centered "bass" \scoreMid
      }
      \new Staff = "bass" \with { instrumentName = "Bass" } {
        \clef "bass"
        \centered "bass" \noteNamesAbove "bass" \scoreBass
      }
    >>
    \layout { indent = 12 }
  }
}
