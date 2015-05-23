#(ly:set-option 'backend 'svg)

blackNote =
  #(let* ((data (ly:gulp-file "black.svg"))
          (stil (ly:make-stencil (list 'embedded-svg data) (cons 0 100) (cons 0 100))))
      stil)

aNote =
  #(let* ((data (ly:gulp-file (string-append "A-" language "-color.svg")))
          (stil (ly:make-stencil (list 'embedded-svg data) (cons 0 100) (cons 0 100))))
      stil)

hNote =
  #(let* ((data (ly:gulp-file (string-append "H-" language "-color.svg")))
          (stil (ly:make-stencil (list 'embedded-svg data) (cons 0 100) (cons 0 100))))
      stil)

cNote =
  #(let* ((data (ly:gulp-file (string-append "C-" language "-color.svg")))
          (stil (ly:make-stencil (list 'embedded-svg data) (cons 0 100) (cons 0 100))))
      stil)

dNote =
  #(let* ((data (ly:gulp-file (string-append "D-" language "-color.svg")))
          (stil (ly:make-stencil (list 'embedded-svg data) (cons 0 100) (cons 0 100))))
      stil)

eNote =
  #(let* ((data (ly:gulp-file (string-append "E-" language "-color.svg")))
          (stil (ly:make-stencil (list 'embedded-svg data) (cons 0 100) (cons 0 100))))
      stil)

fNote =
  #(let* ((data (ly:gulp-file (string-append "F-" language "-color.svg")))
          (stil (ly:make-stencil (list 'embedded-svg data) (cons 0 100) (cons 0 100))))
      stil)

gNote =
  #(let* ((data (ly:gulp-file (string-append "G-" language "-color.svg")))
          (stil (ly:make-stencil (list 'embedded-svg data) (cons 0 100) (cons 0 100))))
      stil)

determineAnimal =
  #(lambda (grob)
     (let* ((dur-log (ly:grob-property grob 'duration-log))
            (pch (ly:event-property (event-cause grob) 'pitch))
            (nnm (ly:pitch-notename pch))
            (stil (case nnm
                    ((0) cNote)
                    ((1) dNote)
                    ((2) eNote)
                    ((3) fNote)
                    ((4) gNote)
                    ((5) aNote)
                    ((6) hNote)
                    (else blackNote)))
            (newstil
              (ly:stencil-translate
                (ly:stencil-scale stil (/ 1.2 60) (/ 1.2 60))
                '(-0.4 . 1))))
            (ly:grob-set-property! grob 'stencil newstil)))


animalNoteHeadsOn = {
  \override NoteHead.font-size = #(magnification->font-size (/ 1 1.1))
  \override Staff.NoteHead.after-line-breaking = #determineAnimal
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
              (lthick (/ (ly:staff-symbol-line-thickness grob) (+ 0.003 t)))
              (stil (ly:grob-property grob 'stencil))
              (w (interval-length xpos))
              (ratio (/ (- w (/ t lthick)) w))
              (newstil (ly:stencil-translate (ly:stencil-scale stil ratio 1.0) (cons (+ t 0.03) 0)))
              )
         (ly:grob-set-property! grob 'stencil newstil)
         ))
}