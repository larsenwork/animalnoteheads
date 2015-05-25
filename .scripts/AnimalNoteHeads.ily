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
            (dur-ext (case dur-log
                   ((2) "")
                   (else "-half")))
            (pch (ly:event-property (event-cause grob) 'pitch))
            (nnm (ly:pitch-notename pch))
            (file (case nnm
                    ((0) (string-append ".eps/C-" language "-color" dur-ext ".eps"))
                    ((1) (string-append ".eps/D-" language "-color" dur-ext ".eps"))
                    ((2) (string-append ".eps/E-" language "-color" dur-ext ".eps"))
                    ((3) (string-append ".eps/F-" language "-color" dur-ext ".eps"))
                    ((4) (string-append ".eps/G-" language "-color" dur-ext ".eps"))
                    ((5) (string-append ".eps/A-" language "-color" dur-ext ".eps"))
                    ((6) (string-append ".eps/H-" language "-color" dur-ext ".eps"))
                    (else ".eps/Black.eps")))
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

determineGrey =
#(lambda (grob)
     (let* ((fsz  (ly:grob-property grob 'font-size 0.0))
            (mult (* 1.25 (magstep fsz)))
            (stl empty-stencil)
            (dur-log (ly:grob-property grob 'duration-log))
            (dur-ext (case dur-log
                   ((2) "")
                   (else "-half")))
            (pch (ly:event-property (event-cause grob) 'pitch))
            (nnm (ly:pitch-notename pch))
            (file (case nnm
                    ((0) (string-append ".eps/C-" language "-bw" dur-ext ".eps"))
                    ((1) (string-append ".eps/D-" language "-bw" dur-ext ".eps"))
                    ((2) (string-append ".eps/E-" language "-bw" dur-ext ".eps"))
                    ((3) (string-append ".eps/F-" language "-bw" dur-ext ".eps"))
                    ((4) (string-append ".eps/G-" language "-bw" dur-ext ".eps"))
                    ((5) (string-append ".eps/A-" language "-bw" dur-ext ".eps"))
                    ((6) (string-append ".eps/H-" language "-bw" dur-ext ".eps"))
                    (else ".eps/Black.eps")))
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



determineBlack =
#(lambda (grob)
     (let* ((fsz  (ly:grob-property grob 'font-size 0.0))
            (mult (* 1.25 (magstep fsz)))
            (stl empty-stencil)
            (dur-log (ly:grob-property grob 'duration-log))
            (dur-ext (case dur-log
                   ((2) "")
                   (else "-half")))
            (pch (ly:event-property (event-cause grob) 'pitch))
            (nnm (ly:pitch-notename pch))
            (file (string-append ".eps/Black" dur-ext ".eps"))
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


langClef = #(string-append ".eps/G-clef-" language ".eps")
myClefSymbol = \markup{
  \lower #2.85
  \epsfile #Y #7.5 #langClef
}
defaultClefSymbol = \markup{
  \lower #2.85
  \epsfile #Y #7.5 #".eps/G-clef-black.eps"
}

animalNoteHeadsOn = {
  \override Staff.NoteHead.stencil = #determineAnimal
  \override Staff.Clef #'stencil = #ly:text-interface::print
  \override Staff.Clef #'text = #myClefSymbol
  \override Staff.NoteHead.stem-attachment = #'(1 . 0)
  \override Staff.Stem.layer = #0
  \override Score.StaffSymbol.thickness = #0.3
  \override Score.StaffSymbol.ledger-line-thickness = #'(0.02 . 0.02)
  \override Stem.thickness = #5
  \override Staff.BarLine.hair-thickness = #.8
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
  \override Staff.NoteHead.stencil = #determineBlack
  \override Staff.Clef #'stencil = #ly:text-interface::print
  \override Staff.Clef #'text = #defaultClefSymbol
  \override Staff.NoteHead.stem-attachment = #'(1 . 0)
  \override Staff.Stem.layer = #0
  \override Score.StaffSymbol.thickness = #0.3
  \override Score.StaffSymbol.ledger-line-thickness = #'(0.02 . 0.02)
  \override Stem.thickness = #5
  \override Staff.BarLine.hair-thickness = #.8
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

animalNoteHeadsGrey = {
  \override Staff.NoteHead.stencil = #determineGrey
  \override Staff.Clef #'stencil = #ly:text-interface::print
  \override Staff.Clef #'text = #myClefSymbol
  \override Staff.NoteHead.stem-attachment = #'(1 . 0)
  \override Staff.Stem.layer = #0
  \override Score.StaffSymbol.thickness = #0.3
  \override Score.StaffSymbol.ledger-line-thickness = #'(0.02 . 0.02)
  \override Stem.thickness = #5
  \override Staff.BarLine.hair-thickness = #.8
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