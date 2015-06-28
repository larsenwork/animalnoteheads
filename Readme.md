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
[LICENSE.md](https://github.com/larsenwork/animalnoteheads/blob/master/LICENSE.md)
