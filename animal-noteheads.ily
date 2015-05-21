\version "2.18.2"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The following numeric values were found by trial and error.
% Trying variables

Anote = \markup {
  \with-dimensions #'(0 . 1.05) #'(0 . 0) 
  \lower #0.6
  \epsfile #Y #1.2 #"A-da-color.eps"
}

Hnote = \markup { 
  \with-dimensions #'(0 . 1.05) #'(0 . 0) 
  \lower #0.6
  \epsfile #Y #1.2 #"H-da-color.eps" 
}

black = \markup {
  \with-dimensions #'(0 . 1.05) #'(0 . 0) 
  \lower #0.6
  \epsfile #Y #1.2 #"black.eps"
}

Cnote = \markup { 
  \with-dimensions #'(0 . 1.05) #'(0 . 0) 
  \lower #0.6
  \epsfile #Y #1.2 #"C-da-color.eps" 
}

Dnote = \markup { 
  \with-dimensions #'(0 . 1.05) #'(0 . 0) 
  \lower #0.6
  \epsfile #X #1.2 #"D-da-color.eps" 
}

Enote = \markup { 
  \with-dimensions #'(0 . 1.05) #'(0 . 0) 
  \lower #0.6 
  \epsfile #X #1.2 #"E-da-color.eps" 
}

Fnote = \markup { 
  \with-dimensions #'(0 . 1.05) #'(0 . 0) 
  \lower #0.6 
  \epsfile #Y #1.2 #"F-da-color.eps" 
}

Gnote = \markup { 
  \with-dimensions #'(0 . 1.05) #'(0 . 0) 
  \lower #0.6 
  \epsfile #X #1.2 #"G-da-color.eps" 
}

determineAnimal =
#(lambda (grob)
     (let* ((fsz  (ly:grob-property grob 'font-size 0.0))
            (mult (* 1.25 (magstep fsz)))
            (stl empty-stencil)
            (dur-log (ly:grob-property grob 'duration-log))
            (pch (ly:event-property (event-cause grob) 'pitch))
            (nnm (ly:pitch-notename pch))
            (stl (grob-interpret-markup grob 
                   (case nnm
                     ((0) #{ \markup \Cnote #})
                     ((1) #{ \markup \Dnote #})
                     ((2) #{ \markup \Enote #})
                     ((3) #{ \markup \Fnote #})
                     ((4) #{ \markup \Gnote #})
                     ((5) #{ \markup \Anote #})
                     ((6) #{ \markup \Hnote #})
                     (else #{ \markup \black #})
                   ))))
     (set! (ly:grob-property grob 'stencil)
           (ly:stencil-scale stl mult mult))))
           
animalNoteHeadsOn = {
  \override Staff.NoteHead.stencil = #determineAnimal
  \override Staff.NoteHead.stem-attachment = #'(1 . 0)
  \override Staff.Stem.layer = #0
  \override Score.StaffSymbol.thickness = #1
  \override Stem.thickness = #2
}

animalNoteHeadsOff = {
  \revert Staff.NoteHead.stencil
  \revert Staff.NoteHead.stem-attachment
  \revert Staff.Stem.layer
%  \revert Score.StaffSymbol.thickness
%  \revert Stem.thickness
}