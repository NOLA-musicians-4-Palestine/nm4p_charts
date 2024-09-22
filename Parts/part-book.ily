\version "2.24.3"

\include "../Style.ly"

\include "../Ana Dammi Falastini/Ana Dammi Falastini.ly"
\include "../Bil Afrah/Bil Afrah.ly"
\include "../Enta Omry/Enta Omry.ly"
\include "../Leve Palestina/Leve Palestina.ly"
\include "../Zeina/Zeina.ly"

\book {
	\bookOutputName \part-name-key
	\header { instrument = \markup { \part-name-key } } 
	\bookpart {
		\Ana_Dammi_Falastini-header
		\score {
			<<
				\new MarkLine \Ana_Dammi_Falastini-Form
				\transpose c \part-key
				\new Staff <<
					\clef \part-clef
					#(Ana_Dammi_Falastini part-name)
					\Ana_Dammi_Falastini-Form
				>>
			>>
		}
	}
	\bookpart {
		\Bil_Afrah-header
		\score {
			<<
				\new MarkLine \Bil_Afrah-Form
				\transpose c \part-key
				\new Staff <<
					\clef \part-clef
					\Bil_Afrah-Melody
					\Bil_Afrah-Form
				>>
			>>
		}
	}
	\bookpart {
		\Enta_Omry-header
		\score {
			<<
				\new MarkLine \Enta_Omry-Form
				\transpose c \part-key
				\new Staff <<
					\clef \part-clef
					\Enta_Omry-Melody
					\Enta_Omry-Form
				>>
			>>
		}
	}
	\bookpart {
		\Leve_Palestina-header
		\score {
			<<
				\new MarkLine \Leve_Palestina-Form
				\transpose c \part-key
				\new Staff <<
					\clef \part-clef
					\Leve_Palestina-Melody
					\Leve_Palestina-Form
				>>
			>>
		}
	}
	\bookpart {
		\Zeina-header
		\score {
			<<
				\new MarkLine \Zeina-Form
				\transpose c \part-key
				\new Staff <<
					\clef \part-clef
					\Zeina-Melody
					\Zeina-Form
				>>
			>>
		}
	}
}