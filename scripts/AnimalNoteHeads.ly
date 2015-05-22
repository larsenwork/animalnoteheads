\version "2.18.2"

#(set! paper-alist (cons '("snippet" . (cons (* 400 mm) (* 300 mm))) paper-alist))

\include "scripts/AnimalNoteHeads.ily"

arranger = #(string-append "Arr.: " arranger)
\header {
  title = #songtitle
  arranger = #arranger
  credits = "© 2015 Andreas Larsen & contributors, free for private and educational use. AnimalNoteHeads.com"
  tagline = ""  % removed
}

titlePageMarkup = \markup \abs-fontsize #10 \column {
	\vspace #3.7
	\fill-line { \fontsize #18 \bold \fromproperty #'header:title }
	\vspace #0.3
	\fill-line { \fontsize #11.2 \fromproperty #'header:arranger }
	\vspace #2.4
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