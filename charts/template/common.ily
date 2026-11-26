\version "2.24.1"

% Copy this folder to start a new chart.

chartName = "Template"
chartVersion = "2026-11-26"

\header {
  title = \chartName
  composer = "Traditional"
  opus = \markup { "Version" \chartVersion }
}

% Optional: names the maqam on the tonic each part reads. Drop both lines for
% a song without one.
maqam = "Nahawand"
concertTonic = #(ly:make-pitch -1 4 0)

\include "../lib/chart.ily"
