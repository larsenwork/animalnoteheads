\version "2.18.2"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The following numeric values were found by trial and error.
% Trying variables

determineAnimal =
#(lambda (grob)
     (let* ((fsz  (ly:grob-property grob 'font-size 0.0))
            (mult (* 1.25 (magstep fsz)))
            (stl empty-stencil)
            (dur-log (ly:grob-property grob 'duration-log))
            (pch (ly:event-property (event-cause grob) 'pitch))
            (nnm (ly:pitch-notename pch))
            (file (case nnm
                    ((0) (string-append "C-" language "-color.eps"))
                    ((1) (string-append "D-" language "-color.eps"))
                    ((2) (string-append "E-" language "-color.eps"))
                    ((3) (string-append "F-" language "-color.eps"))
                    ((4) (string-append "G-" language "-color.eps"))
                    ((5) (string-append "A-" language "-color.eps"))
                    ((6) (string-append "H-" language "-color.eps"))
                    (else "black.eps")))
            (stl (grob-interpret-markup grob
                   #{ \markup {
                        \with-dimensions #'(0.15 . 1.05) #'(0 . 0)
                        \lower #0.6
                        \epsfile #Y #1.2 #file
                      }
                   #}))
            )
     (ly:grob-set-property! grob 'stencil
           (ly:stencil-scale stl mult mult))))

animalNoteHeadsOn = {
  \override Staff.NoteHead.stencil = #determineAnimal
  \override Staff.NoteHead.stem-attachment = #'(1 . 0)
  \override Staff.Stem.layer = #0
  \override Staff.Clef #'color = #(rgb-color 0.8 0.82 0.84)
%  \override Score.StaffSymbol.color = #grey
%  \override Staff.BarLine.color = #grey
%  \override Staff.LedgerLineSpanner.color = #grey
  \override Score.StaffSymbol.thickness = #0.5
  \override Score.StaffSymbol.ledger-line-thickness = #'(0.03 . 0.03)
  \override Stem.thickness = #4.4
  \override Staff.BarLine.hair-thickness = #.8
  % the following helps clean up parts of the beam that extend
  % beyond the stems (it's not perfect, though) and is dependent
  % upon StaffSymbol.thickness ~ 0.5 (give or take a little) and
  % Stem.thickness ~ 4.5 (give or take a little)
  \override Beam.after-line-breaking =
    #(lambda (grob)
       (let* ((xpos (ly:grob-property grob 'X-positions))
              (stem (ly:grob-array-ref (ly:grob-object grob 'stems) 0))
              (t (layout-line-thickness grob))
              (lthick (/ (ly:staff-symbol-line-thickness grob) t))
              (stil (ly:grob-property grob 'stencil))
              (w (interval-length xpos))
              (ratio (/ (- w (/ t lthick)) w))
              (newstil (ly:stencil-translate (ly:stencil-scale stil ratio 1.0) (cons t 0)))
              )
         (ly:grob-set-property! grob 'stencil newstil)
         ))
}

animalNoteHeadsOff = {
  \revert Staff.NoteHead.stencil
  \revert Staff.NoteHead.stem-attachment
  \revert Staff.Stem.layer
%  \revert Score.StaffSymbol.thickness
%  \revert Stem.thickness
}

%{
test = { c'8 d' e' f' g' a' b'4 }

#(set! paper-alist (cons '("snippet" . (cons (* 400 mm) (* 300 mm))) paper-alist))

\header {
  tagline = ##f  % removed
}

\paper {
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
#(set-global-staff-size 125)

\score {
  \new Staff {
    << \test \\ \test >>
  }
  \layout {
    \omit Staff.TimeSignature
    \omit Score.BarNumber
    \animalNoteHeadsOn
  }
}
%}