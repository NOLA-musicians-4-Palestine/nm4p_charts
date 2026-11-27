# Charts

Each folder is one chart, built on the shared framework in `lib/chart.ily`. `template/` is a minimal chart to copy when starting a new one.

## Layout of a chart

- `common.ily`: song metadata (`chartName`, `\header` with `composer` and `arranger`, optional `maqam` and `concertTonic`), then `\include "../lib/chart.ily"`. The framework sets the subtitle to "For Hanoun Brass Band"; a medley lists its tunes in `subsubtitle`.
- One `.ily` per tune: the music at concert pitch, in variables.
- One `.ly` per role (`high.ly`, `mid.ly`, `bass.ly`…): assembles the form from the tune variables, then calls `\part` once per instrument. Each call prints a one-page PDF named `<chartName> - <instrument>.pdf`.
- `score.ly`: all roles at concert pitch.

## Building

```
cd charts/template
lilypond high.ly
```

`lib/watch.sh <chart folder>` builds every `.ly` of a chart, then rebuilds on each save there or in `lib/`. It needs `fswatch` on macOS (`brew install fswatch`) or `inotifywait` on Linux.

## Framework

| Helper | Use |
|---|---|
| `\rehearsal name label` | Section bar, boxed name (omitted when empty) and an italic cue. |
| `\lines n music` | Breaks `music` into `n` lines of equal length, the same in every part. |
| `\fit music` | Octave free: each part moves it by whole octaves to sit around the middle of its staff. |
| `\fitLow music` / `\fitHigh music` / `\fitDown music` | Like `\fit`, first note near the bottom line / one octave higher / one octave lower. |
| `\chordsAbove staff chords` | Chord names above the staff named `staff` (`"part"` in a `\part`). |
| `\optionalChord chord` | Inside `\chordsAbove` chords: names it "optional, on call", with a dashed bracket. |
| `\noteNamesAbove staff music` | Prints `music` with its note names above the staff named `staff`, a reading aid for bass parts. A name repeats only after a different one. |
| `\dashedBracket label music` | Dashed bracket over `music`, opened by `label`. |
| `\part name clef sounding music` | One instrument's PDF. `sounding` is the concert pitch heard for a written c: `c`, `bes`, `es`, `f`. A `♭` in `name` is drawn as a flat and spelled `b` in the filename. |
| `\centered clef music` | Applies the `\fit` placement at concert pitch, for scores. |
| `#(maqam-markup sounding)` | The maqam line for a `\header` `meter`. |

There is no key signature: every accidental is written, and the maqam is named on the tonic each instrument reads.
