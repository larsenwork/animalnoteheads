\version "2.18.2"

#(set! paper-alist (cons '("snippet" . (cons (* 400 mm) (* 300 mm))) paper-alist))
\markup\vspace #.5
#(set-global-staff-size 125)
#(define (override-color-for-all-grobs color)
  (lambda (context)
   (let loop ((x all-grob-descriptions))
    (if (not (null? x))
     (let ((grob-name (caar x)))
      (ly:context-pushpop-property context grob-name 'color color)
      (loop (cdr x)))))))

\include ".scripts/AnimalNoteHeads.ily"

arranger = #(string-append "Arr.: " arranger)
\header {
  title = #songtitle
  arranger = #arranger
  credits = "© 2015 Andreas Larsen & contributors, free for private and educational use. AnimalNoteHeads.com"
  tagline = ""  % removed
}

titlePageMarkup = \markup \abs-fontsize #10 \column {
  \vspace #2.5
	\fill-line { \fontsize #18 \bold \fromproperty #'header:title }
	\vspace #0.3
	\fill-line { \fontsize #11.2 \fromproperty #'header:arranger }
	\vspace #2.8
	\fill-line { \fontsize #7 \fromproperty #'header:credits }
}

\paper {
  bookTitleMarkup = \titlePageMarkup
  #(set-paper-size "snippet")
  print-page-number = ##f
  system-system-spacing = #'((basic-distance . 12) (padding . 2))
  ragged-right = ##f
  indent = 0
  top-margin = 35\mm
  bottom-margin = 35\mm
  left-margin = 5\mm
  right-margin = 5\mm
  fonts = #(set-global-fonts
            #:roman "Gidole"
            #:factor (/ staff-height pt 20))
}

\pageBreak
\allowPageTurn
\score {
  \new Staff {
    \music
  }
  \midi { \music }
  \layout {
    \omit Staff.TimeSignature
    \omit Score.BarNumber
    \animalNoteHeadsOn
  }
}


\pageBreak
\allowPageTurn
\score {
  \new Staff {
    \music
  }
  \layout {
    \omit Staff.TimeSignature
    \omit Score.BarNumber
    \animalNoteHeadsOff
  }
}

\pageBreak
\allowPageTurn
\score {
  \new Staff {
    \music
  }
  \layout {
    \omit Staff.TimeSignature
    \omit Score.BarNumber
    \animalNoteHeadsGrey
  }
}