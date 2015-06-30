This is the branch where we are developing the app.


#How to get Started :

##Windows
//todo
##MacOS
//todo

##Linux
###What you need :

* Lilypond package installed (and added to your $PATH) -> see official website
* nodejs installed (tested with 0.10.38) and npm (tested with 1.4.28) -> see official website

In the project root folder run :
```
npm install
```
to install deps specified in package.json

In the project root folder run :
```
./node_modules/electron-prebuilt/dist/electron main.js
```
to run the app.

Once the app is started, input Title, Arranger name and simple lilypond script :
```
\version "2.14.1"
{
  <c' d'' b''>8. ~ <c' d'' b''>8
}
```
then click "Generate sheets" button.

I should create a new PDF in output/ folder named [your_title].pdf
