Open iOS links inside web app view
===========

When you've installed a web page on your iOS homescreen using Safari, the website becomes a web-app when it utilizes the following meta keys:

```html
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes"> <!-- this is the only required meta -->
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
```

Using the `iosweblinks` code snippet, iOS won't open a new browser for every anchor you click in the 'web view' app.

# Installation

```sh
bower install --save-dev stylr/iosweblinks
```

You can use this in combination with for example [grunt-wiredep](https://github.com/stephenplusplus/grunt-wiredep) to install this package as a (development) dependency.

#### Credits

Credits go to @kylebarrow and contributors in this gist: https://gist.github.com/kylebarrow/1042026
