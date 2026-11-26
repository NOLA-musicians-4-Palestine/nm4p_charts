\version "2.24.1"

chartName = "Bahlam Beek"
chartVersion = "2026-11-26"

\header {
  title = \chartName
  composer = "Abdel Halim Hafez"
  arranger = "arr. Romain Beauxis"
  opus = \markup { "Version" \chartVersion }
}

maqam = "Nahawand"
concertTonic = #(ly:make-pitch -1 1 0)

\include "../lib/chart.ily"
