\version "2.24.1"

% Shared chart framework. A song's common.ily defines chartName and, for modal
% songs, maqam and concertTonic, then includes this file.
%
% A role file builds its form from the song variables, wrapping each section in
% \rehearsal (section bar and boxed label), \fit (octave free) and \lines (fixed
% line breaks). It then calls \part once per instrument, which transposes the
% form, centres each \fit section on the staff and prints a one-page PDF.
% A concert-pitch score uses \centered instead of \part.

% Note name of a pitch with its accidental, for the maqam line ("Nahawand A").
#(define (pitch-name-markup pitch)
   (let ((letter (string (string-ref "CDEFGAB" (ly:pitch-notename pitch))))
         (alteration (ly:pitch-alteration pitch)))
     (cond ((= alteration FLAT) #{ \markup \concat { #letter \flat } #})
           ((= alteration SHARP) #{ \markup \concat { #letter \sharp } #})
           (else letter))))

% A song's tune list goes in subsubtitle, under the band name.
\header {
  subtitle = "For Hanoun Brass Band"
  tagline = ##f
}

#(set-global-staff-size 18)

\paper {
  indent = 0
}

\layout {
  \context {
    \Score
    \numericTimeSignature
    \override RehearsalMark.self-alignment-X = #LEFT
    \override MetronomeMark.outside-staff-priority = #2000
    skipBars = ##t
  }
  \context {
    \Staff
    countPercentRepeats = ##t
  }
  \context {
    \Voice
    \override TextSpanner.style = #'dashed-line
    \override TextSpanner.dash-period = #1.5
    \override TextSpanner.thickness = #2
    \override TextSpanner.bound-details.left.text = \markup \override #'(thickness . 2) \draw-line #'(0 . -1)
    \override TextSpanner.bound-details.right.text = \markup \override #'(thickness . 2) \draw-line #'(0 . -1)
    \override TextSpanner.bound-details.left.padding = #0
    \override TextSpanner.bound-details.right.padding = #0
  }
}

% Starts a section: a section bar, then the boxed name (omitted when empty)
% and an italic cue; the bar falls on the previous line end.
rehearsal =
#(define-music-function (name label) (string? markup?)
   #{
     \section
     \mark #(if (string-null? name)
                #{ \markup \italic #label #}
                #{ \markup { \box \bold #name \italic #label } #})
   #})

% Splits a section into count lines of equal length with a parallel voice of
% breaks; \part turns automatic breaks off, so every part breaks on the same bars.
lines =
#(define-music-function (count music) (index? ly:music?)
   (let* ((step (ly:moment-div (ly:music-length music) (ly:make-moment count)))
          (skip (make-music 'SkipEvent 'duration (make-duration-of-length step))))
     #{ << #music { \repeat unfold #(1- count) { #skip \break } } >> #}))

% Marks a section whose octave is free: \part and \centered later move it by
% whole octaves so its range sits around the middle line of the staff.
fit = #(define-music-function (music) (ly:music?) #{ \tag #'fit #music #})

% Like \fit, but puts the first note of the section nearest the bottom line.
fitLow = #(define-music-function (music) (ly:music?) #{ \tag #'fit-low #music #})

% Like \fit, then one octave higher.
fitHigh = #(define-music-function (music) (ly:music?) #{ \tag #'fit-high #music #})

% Like \fit, then one octave lower.
fitDown = #(define-music-function (music) (ly:music?) #{ \tag #'fit-down #music #})

% Diatonic step of each clef's middle line, counted from middle C.
#(define staff-middle-step '(("treble" . 6) ("bass" . -6)))

% Diatonic distance of a pitch from middle C, ignoring accidentals.
#(define (pitch-step pitch)
   (+ (* 7 (ly:pitch-octave pitch)) (ly:pitch-notename pitch)))

% Steps of the notes printed on the staff, in time order; chord names are
% skipped since their pitches are not on the staff.
#(define (staff-pitch-steps music)
   (if (and (music-is-of-type? music 'context-specification)
            (eq? (ly:music-property music 'context-type) 'ChordNames))
       '()
       (let ((pitch (ly:music-property music 'pitch))
             (element (ly:music-property music 'element)))
         (append (if (ly:pitch? pitch) (list (pitch-step pitch)) '())
                 (if (ly:music? element) (staff-pitch-steps element) '())
                 (append-map staff-pitch-steps
                             (ly:music-property music 'elements))))))

% Transposes music by the whole octaves that bring the centre of its range
% closest to middle-step, or with low its first note closest to the bottom
% line, mutating music in place.
#(define (center-on-staff middle-step low music)
   (let ((steps (staff-pitch-steps music)))
     (if (null? steps)
         music
         (let* ((current (if low
                             (car steps)
                             (/ (+ (apply min steps) (apply max steps)) 2)))
                (target (if low (- middle-step 4) middle-step))
                (octaves (round (/ (- target current) 7))))
           (ly:music-transpose music (ly:make-pitch octaves 0 0))))))

% Applies center-on-staff to every section tagged by \fit, \fitLow, \fitHigh or
% \fitDown, independently.
#(define (center-fit-sections middle-step music)
   (music-map
    (lambda (m)
      (let ((tags (ly:music-property m 'tags)))
        (cond ((memq 'fit tags) (center-on-staff middle-step #f m))
              ((memq 'fit-low tags) (center-on-staff middle-step #t m))
              ((memq 'fit-high tags)
               (ly:music-transpose (center-on-staff middle-step #f m)
                                   (ly:make-pitch 1 0 0)))
              ((memq 'fit-down tags)
               (ly:music-transpose (center-on-staff middle-step #f m)
                                   (ly:make-pitch -1 0 0)))
              (else m))))
    music))

% A flat sized for running text: the text font has no ♭ glyph, so the music
% font's flat is scaled down and raised to sit beside letters.
#(define text-flat
   (make-raise-markup 0.5 (make-fontsize-markup -3 (make-flat-markup))))

% A part name as markup, with each ♭ drawn as text-flat.
#(define (name-markup name)
   (let ((pieces (string-split name #\♭)))
     (make-concat-markup
      (cons (car pieces)
            (append-map (lambda (piece) (list text-flat piece))
                        (cdr pieces))))))

% Chord name followed by the optional-chord note.
#(define (optional-chord-name pitches bass inversion context)
   (make-line-markup
    (list (ignatzek-chord-names pitches bass inversion context)
          (make-hspace-markup 1)
          (make-italic-markup "optional, on call"))))

% Marks a chord as optional: \chordsAbove names it with the note above and a
% dashed bracket over the bars it lasts.
optionalChord =
#(define-music-function (chord) (ly:music?)
   #{
     \tag #'optional {
       \set chordNameFunction = #optional-chord-name
       #chord
       \unset chordNameFunction
     }
   #})

% Skips lasting length that draw the dashed bracket styled in \layout; it stops
% a 64th early so it ends before the bar line.
#(define (bracket-skips length)
   (let ((tail (ly:make-moment 1/64)))
     (make-sequential-music
      (list (make-music 'SkipEvent
                        'duration (make-duration-of-length (ly:moment-sub length tail))
                        'articulations (list (make-music 'TextSpanEvent
                                                         'span-direction START)))
            (make-music 'SkipEvent
                        'duration (make-duration-of-length tail)
                        'articulations (list (make-music 'TextSpanEvent
                                                         'span-direction STOP)))))))

% Draws a dashed bracket over music, opened by label in italics.
dashedBracket =
#(define-music-function (label music) (markup? ly:music?)
   #{
     <<
       #music
       {
         \once \override TextSpanner.bound-details.left.text = \markup {
           \override #'(thickness . 2) \draw-line #'(0 . -1)
           \italic #label
         }
         $(bracket-skips (ly:music-length music))
       }
     >>
   #})

% Turns chords into skips of the same length, with a bracket over each
% \optionalChord.
#(define (chord-brackets chords)
   (music-map
    (lambda (m)
      (cond
       ((music-is-of-type? m 'event-chord)
        (make-music 'SkipEvent 'duration (make-duration-of-length (ly:music-length m))))
       ((memq 'optional (ly:music-property m 'tags))
        (bracket-skips (ly:music-length m)))
       (else m)))
    (ly:music-deep-copy chords)))

% Prints chords as names above the staff called staff, with a dashed bracket on
% the staff over each \optionalChord.
chordsAbove =
#(define-music-function (staff chords) (string? ly:music?)
   #{
     <<
       \new ChordNames \with {
         alignAboveContext = #staff
         chordChanges = ##t
         minorChordModifier = \markup "–"
       }
       $chords
       $(chord-brackets chords)
     >>
   #})

% Prints music with the name of each note above the staff called staff, a
% reading aid for bass parts. A name repeats only after a different one, so
% tied notes and octave jumps stay unnamed.
noteNamesAbove =
#(define-music-function (staff music) (string? ly:music?)
   (let ((previous #f)
         (previous-moment #f))
     (define (changed-name pitch context)
       (let ((key (cons (ly:pitch-notename pitch) (ly:pitch-alteration pitch)))
             (now (ly:context-current-moment context)))
         ;; Each \part book replays the same music from moment 0.
         (if (and previous-moment (ly:moment<? now previous-moment))
             (set! previous #f))
         (set! previous-moment now)
         (if (equal? key previous)
             ""
             (begin
              (set! previous key)
              (pitch-name-markup pitch)))))
     #{
       <<
         #music
         \new NoteNames \with {
           alignAboveContext = #staff
           noteNameFunction = #changed-name
         }
         $(ly:music-deep-copy music)
       >>
     #}))

% Centres the \fit sections of a concert-pitch staff for the given clef, as
% \part does after transposing; used by score.ly.
centered =
#(define-music-function (clef music) (string? ly:music?)
   (center-fit-sections (assoc-get clef staff-middle-step) music))

% Maqam line for an instrument: the maqam named on the tonic it reads, or
% empty when the song sets no maqam.
#(define (maqam-markup sounding)
   (let ((maqam (ly:parser-lookup 'maqam)))
     (if (null? maqam)
         ""
         (let ((tonic (ly:pitch-transpose
                       (ly:parser-lookup 'concertTonic)
                       (ly:pitch-diff (ly:make-pitch 0 0 0) sounding))))
           #{ \markup { #maqam #(pitch-name-markup tonic) } #}))))

% Prints one instrument as a one-page book named "<chartName> - <name>", with ♭
% spelled b in the filename. sounding is the concert pitch class heard when the
% instrument reads a written c.
%
% A void function handing its book to the top-level handler: LilyPond 2.26
% rejects a \book returned by a function at top level.
part =
#(define-void-function (name clef sounding music)
   (string? string? ly:pitch? ly:music?)
   (let ((written (center-fit-sections
                   (assoc-get clef staff-middle-step)
                   #{ \transpose #sounding c' #music #})))
     (toplevel-book-handler
      #{
        \book {
          \paper { page-count = 1 }
          \bookOutputName #(string-append
                            (ly:parser-lookup 'chartName)
                            " - "
                            (string-map (lambda (c) (if (char=? c #\♭) #\b c)) name))
          \header {
            instrument = #(name-markup name)
            meter = #(maqam-markup sounding)
          }
          \score {
            \new Staff = "part" {
              \clef #clef
              \autoLineBreaksOff
              #written
            }
          }
        }
      #})))
