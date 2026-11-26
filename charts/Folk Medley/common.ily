\version "2.24.1"

chartName = "Folk Medley"
chartVersion = "2026-11-26"

\header {
  title = \chartName
  subtitle = "Ya Zarif A'tul / 3la Del3ouna / Wein 3a Ramallah"
  composer = "Palestinian folk"
  opus = \markup { "Version" \chartVersion }
}

% Westernized Bayati: the half-flat E is played as E♭.
maqam = "Westernized Bayati"
concertTonic = #(ly:make-pitch -1 1 0)

\include "../lib/chart.ily"
