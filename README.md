#Notes from Sept. 22, '24
Created Parts folder.
* parts-book.ily is helper file which can take variables to generate different parts
* Parts.ly contains specific values for different parts/transpositions/clefs

##Todo:
Check generated parts for correctness
* Fix several cases where transpositions too far off staff
* Titles and other markup correct

Generate parts in phone version

Merge Simon's "Ana Dammi" with Zach's
* Add Simon musical content
* Use standardized formatting from Zach to work with automated part building

Make Folk Medley in lilypond
* Add to parts-book.ily
* Regenerate parts
* Add to Score.l
y
#Notes from Sept. 21, '24
##Todo:
~~Book per player:~~
* ~~Part+Clef > Transposition~~

~~Find a way to generate transpositions dynamically:~~
* ~~Put in key as a variable when calling lilypond~~
* ~~Add key in header text~~
* ~~Change file name to include key~~

~~Or do it by hand, case by case?~~

More semantic structure for files i.e. break out melodies into variables

Don't need chords as staves. Chords are just notes as letters. Find a way to print letters maybe.

Output individual songs:
* Score
* Parts
* Some common part transpositions

#For Boston
Goal is to share. Phone formatting and 8.5x11 formatting.
Elements:
* Parts in common keys, split up by song
* Probably not full score. 
* Create Folk Medley .ly files 