# Prepro

A C-like preprocessor that is completely language agnostic.

## What?

For know it allows the `#define` and `#include "filename"` directives. 

In order to facilitate usage you may have up to two arbitrary characters before the directive.

```js
//#define __URL__ "https://www.dein-web-widget.de"
//#define __DEBUG__ true

let settings = {
  url: __URL__,
  debug: __DEBUG__
};

//#include "underscore.js"
//#include "main.js"
```

The resulting file will look like this:

```js

let settings = {
  url: "https://www.dein-web-widget.de",
  debug: true
};

// ... the content of "underscore.js" ...
// ... the content of "main.js" ...
```



## How?

You have to have Lua installed.

```bash
lua prepro.lua input.js > output.js
```

## Why?

I was searching a way to use the C-Preprocessor on JavaScript files. While this is possible and has been done (e.g. https://rreverser.com/es6-modules-are-dead-long-live-c-preprocessor/), there are some problems:

1. The C-Preprocessor knows about C and does some manipulations on the file which may lead to errors
2. The preprocessor directives are unknown by js, leading to trouble with Syntax highlighting

