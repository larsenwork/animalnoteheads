\version "2.18.2"
#(set! paper-alist (cons '("snippet" . (cons (* 400 mm) (* 300 mm))) paper-alist))

\header {
  title = "Lille Peter Edderkop"
  arranger = "Arr. by Andreas Larsen"
  credits = "© 2015 AnimalNoteHeads.com CC-BY-ND-4.0"
  tagline = ""  % removed
}

titlePageMarkup = \markup \abs-fontsize #10 \column {
	\vspace #3.7
	\fill-line { \fontsize #18 \bold \fromproperty #'header:title }
	\vspace #0.3
	\fill-line { \fontsize #11.2 \fromproperty #'header:arranger }
	\vspace #3.2
	\fill-line { \fontsize #7 \fromproperty #'header:credits }
}
\paper {
  bookTitleMarkup = \titlePageMarkup
  #(set-paper-size "snippet")
  print-page-number = ##f
  system-system-spacing = #'((basic-distance . 9) (padding . 1))
  ragged-right = ##f
  indent = 0
  top-margin = 0\in
  bottom-margin = 0\in
  left-margin = 0.2\in
  right-margin = 0.2\in
}
\markup\vspace #.5
#(set-global-staff-size 125)
\paper {
  fonts = #(set-global-fonts
            #:roman "Gidole"
            #:factor (/ staff-height pt 20))
}

\include "animal-language.ly"
\include "animal-noteheads.ily"

music = {
  c'8 c' c' d' e' e' e'4 |
  d'8 d' d' e' c'4 c' |
  e'4 e'8 f' g'4 g'8 g' |
  f'8 f' f' g' e'4 r |
  c''4 c'' b' b'8 b' |
  a'8 a' a' a' g'4 r |
  c'8 c' c' d' e' e' e'4 |
  d'8 d' d' e' c'4 r
}

\pageBreak
\allowPageTurn
\score {
  \new Staff {
    %<< { \music } \\ { \music } >>
    \music
  }
  \layout {
    \omit Staff.TimeSignature
    \omit Score.BarNumber
    \animalNoteHeadsOn
  }
}
