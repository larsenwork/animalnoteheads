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
                    ((0) (string-append "eps/C-" language "-color.eps"))
                    ((1) (string-append "eps/D-" language "-color.eps"))
                    ((2) (string-append "eps/E-" language "-color.eps"))
                    ((3) (string-append "eps/F-" language "-color.eps"))
                    ((4) (string-append "eps/G-" language "-color.eps"))
                    ((5) (string-append "eps/A-" language "-color.eps"))
                    ((6) (string-append "eps/H-" language "-color.eps"))
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
  \override Score.StaffSymbol.thickness = #0.3
  \override Score.StaffSymbol.ledger-line-thickness = #'(0.02 . 0.02)
  \override Stem.thickness = #5
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
              (lthick (/ (ly:staff-symbol-line-thickness grob) (+ 0.002 t)))
              (stil (ly:grob-property grob 'stencil))
              (w (interval-length xpos))
              (ratio (/ (- w (/ t lthick)) w))
              (newstil (ly:stencil-translate (ly:stencil-scale stil ratio 1.0) (cons (+ t 0.028) 0)))
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
