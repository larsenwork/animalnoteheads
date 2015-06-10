#Creating Sheets
Please note that creating sheets is currently a bit technical requiring you to know how to use command line. We are making an app (also open sourced) that will make it easier to create your own sheets. Follow [@larsenwork](http://twitter.com/larsenwork) on twitter to get notified about releases.

###Prerequisites  
* [Lilypond](http://www.lilypond.org)
    * Ignore the instructions about command-line 
* [Gidole font](http://gidole.github.io)
    * It's the one I'm using on AnimalNoteHeads.com
    * Mac users: You have to copy it manually to `/Library/Fonts` and not `~/Library/Fonts` for Lilypond to be able to "find" it
* [Node](https://nodejs.org)

###Making sheets
1. Rename and open `EditMe.ly`
1. Change what needs changing - see `Lille Peter Edderkop.ly` if you're unsure how it should look.
1. Save and Typeset the file

You should now have `Your Song.pdf` with 3 versions of the song - one with colored animals, one with normal note heads and one with uncolored animals.

###Convert to svg
Open terminal:

* `cd` into the `pdf2svg` folder
* `node .pdf2svg.js PATH-TO-THE-PDF`
* You should now have the numbered svg files in the `pdf2svg` folder


#License


AnimalNoteHeads is licensed under MIT License *except for the animal drawings* 
that are copyright (c) 2015 Andreas Larsen, free for private and educational 
use only.  
Any publication (online or print) requires a seperate license 
obtained from andreas@animalnoteheads.com.

**The MIT License (MIT)**

Copyright (c) 2015 Andreas Larsen and Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
