\version "2.18.2"
#(set! paper-alist (cons '("snippet" . (cons (* 400 mm) (* 300 mm))) paper-alist))
\paper {
  #(set-paper-size "snippet")
  ragged-right = ##f
  indent = 0
  top-margin = 0\in
  bottom-margin = 0\in
  left-margin = 0.05\in
  right-margin = 0.05\in
}
\markup\vspace #.5
#(set-global-staff-size 100)
\paper {
  fonts = #(set-global-fonts
            #:factor (/ staff-height pt 20))
}

\include "animal-noteheads.ily"
\header {
  title = \markup { \abs-fontsize #12 "Mary Had A Little Lamb" } 
  tagline = \markup { \abs-fontsize #12 "© 2015 AnimalNoteHeads.com CC-BY-ND-4.0" }
  arranger = \markup { \abs-fontsize #12 "Arr.: Andreas Larsen"}
}

music = { a b c' d' e' f' g' a' b' c'' d'' e'' f'' g'' }

\score {
  \new Staff {
    \omit Staff.TimeSignature
    \animalNoteHeadsOn
    %<< { \music } \\ { \music } >>
    \music
  }
}