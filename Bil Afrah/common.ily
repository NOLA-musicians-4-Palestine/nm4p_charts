\version "2.24.1"

% Shared by high.ly, mid.ly, bass.ly and score.ly, after the song material.
%
% A role file builds its form from the song variables, wrapping each section in
% \rehearsal (section bar and boxed label), \fit (octave free) and \lines (fixed
% line breaks). It then calls \part once per instrument, which transposes the
% form, centres each \fit section on the staff and prints a one-page PDF.
% score.ly uses \centered instead of \part to keep concert pitch.

chartVersion = "2026-11-14"

\header {
  title = "Bil Afrah"
  subtitle = "Ya Habibi Koullama / Chirak"
  composer = "Rahbani Brothers / Armenian folk"
  opus = \markup { "Version" \chartVersion }
  tagline = ##f
}

% No key signature: every accidental is written. The maqam is named instead,
% on the tonic each instrument reads.
maqam = "Nahawand"
concertTonic = #(ly:make-pitch -1 4 0)

% Note name of a pitch with its accidental, for the "Maqam ... on X" line.
#(define (pitch-name-markup pitch)
   (let ((letter (string (string-ref "CDEFGAB" (ly:pitch-notename pitch))))
         (alteration (ly:pitch-alteration pitch)))
     (cond ((= alteration FLAT) #{ \markup \concat { #letter \flat } #})
           ((= alteration SHARP) #{ \markup \concat { #letter \sharp } #})
           (else letter))))

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

% Diatonic step of each clef's middle line, counted from middle C.
#(define staff-middle-step '(("treble" . 6) ("bass" . -6)))

% Diatonic distance of a pitch from middle C, ignoring accidentals.
#(define (pitch-step pitch)
   (+ (* 7 (ly:pitch-octave pitch)) (ly:pitch-notename pitch)))

% Transposes music by the whole octaves that bring the centre of its range
% closest to middle-step, or with low its first note closest to the bottom
% line, mutating music in place.
#(define (center-on-staff middle-step low music)
   (let ((steps '()))
     (music-map
      (lambda (m)
        (let ((pitch (ly:music-property m 'pitch)))
          (if (ly:pitch? pitch)
              (set! steps (cons (pitch-step pitch) steps))))
        m)
      music)
     (if (null? steps)
         music
         (let* ((current (if low
                             (last steps)
                             (/ (+ (apply min steps) (apply max steps)) 2)))
                (target (if low (- middle-step 4) middle-step))
                (octaves (round (/ (- target current) 7))))
           (ly:music-transpose music (ly:make-pitch octaves 0 0))))))

% Applies center-on-staff to every section tagged by \fit or \fitLow,
% independently.
#(define (center-fit-sections middle-step music)
   (music-map
    (lambda (m)
      (let ((tags (ly:music-property m 'tags)))
        (cond ((memq 'fit tags) (center-on-staff middle-step #f m))
              ((memq 'fit-low tags) (center-on-staff middle-step #t m))
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

% Centres the \fit sections of a concert-pitch staff for the given clef, as
% \part does after transposing; used by score.ly.
centered =
#(define-music-function (clef music) (string? ly:music?)
   (center-fit-sections (assoc-get clef staff-middle-step) music))

% Prints one instrument as a one-page book named "Bil Afrah - <name>", with ♭
% spelled b in the filename and the maqam named on the tonic it reads.
% sounding is the concert pitch class heard when the instrument reads a written c.
part =
#(define-scheme-function (name clef sounding music)
   (string? string? ly:pitch? ly:music?)
   (let ((written (center-fit-sections
                   (assoc-get clef staff-middle-step)
                   #{ \transpose #sounding c' #music #}))
         (tonic (ly:pitch-transpose concertTonic
                                    (ly:pitch-diff (ly:make-pitch 0 0 0) sounding))))
     #{
       \book {
         \paper { page-count = 1 }
         \bookOutputName #(string-append "Bil Afrah - "
                                         (string-map (lambda (c) (if (char=? c #\♭) #\b c)) name))
         \header {
           instrument = #(name-markup name)
           meter = \markup { "Maqam" #maqam "on" #(pitch-name-markup tonic) }
         }
         \score {
           \new Staff {
             \clef #clef
             \autoLineBreaksOff
             #written
           }
         }
       }
     #}))
