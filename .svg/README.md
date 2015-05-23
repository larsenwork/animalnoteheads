How to use embedded svg files
=============================

In this directory are files needed to make AnimalNoteHeads work with native svg
files. There are currently only the English files, but it is extendable to other
languages.

Each .svg file contains the stripped down svg code, so you won't find the
regular <svg> and </svg> tags. For some reason, LilyPond doesn't handle the 
<svg> tags. The file contents are what is normally contained INSIDE those tags.
This trimming needs to be done manually (or with a script, of course) for each
glyph image. There is a known issue with the giraffe image, which doesn't clip
the spots, for some reason.

To use in LilyPond, the workflow is the same as with the PDF version. The
language can still be pre-defined by the user along with the other input fields.