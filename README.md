# AngularJS Experiments with Shiny

# Overview

Based on the trivial examples on the Angular website I wanted to experiment with
various other technologies.  The traditional HTML+JS+CSS stack definitely works
but what about alternative template languages like Haml and Slim?  How about
CoffeeScript?  SCSS or SASS or Less? All of these compile to their respective
counterparts in HTML+JS+CSS but _should_ (in theory) reduce some degree of
overhead.

## Lab Notebook

### Hello World

#### Overview
In the Hello World example there was no external Javascript so the only
comparison is HTML vs. Haml vs. Slim but the three showed their strengths
immediately:

The HTML version is the baseline and is copied directly from the [first
example](http://angularjs.org/#hello-html) on the AngularJS website.


#### Notes
Slim and Haml are both elegant in their use of whitespace delimiters instead of
closing tags.  The Haml version ended up being the exact same length as the Slim
version.  The major difference is in the (elegant IMO) way that Haml handles
data-attributes.

In Haml data-attributes are treated as a nested-hash a-la Ruby.  If you use the
Ruby 1.9 style syntax ( e.g. `%some_tag{class: "magic", data: {attr1: "val1",
attr2: "val2"}}`) the produced HTML is `<some_tag class="magic"
data-attr1="val1" data-attr2="val2">`.  In the case of data-attributes this
feels fairly natural but in the case of Angular attributes the pattern
`%some_tag{ng: {attr: "val"}}` feels less natural than Slim's syntax which
mirrors HTML almost exactly (e.g. `some_tag ng-attr="val"`).  This may change,
and the Haml syntax may feel better if later multiple Angular attributes are
passed to a single tag.

The other option is to use a Ruby 1.8-alike syntax for Angular tags which reads
less elegantly to me (e.g.  `%some_tag{"ng-attr1" => "val1"}`).  The reason this
reads less elegantly as it does not resemble the HTML from which it comes and
1.9 just looks "better" to me when properly syntax highlighted.

### Todo

#### Overview
The standard example application for any MV\* Javascript framework is a Todo
List.  In this case there are three components:  Layout (HTML), Styling
information (CSS), and application logic (JS)

In this example it is worth comparing the HTML+JS+CSS version in components to
the Slim and Haml versions for Markup and the CoffeeScript version for
application logic.

#### Notes

##### Markdown languages

Slim's data-attribute syntax felt much more natural than the nested-hash version
in Haml, for the same reasons as in Hello World above: a single attribute
requires the nested hash.  If we later have multiple attributes this may
be more elegant.

In order to have copy with a template'd value first (e.g.
`<span>{{value}}</span>`) in Slim you must place the template'd copy on its own
line leading with a `|`, Haml does not have this limitation.

Both Haml and Slim struggle to wrap something in `[]`'s (for example).  The
reason for this is clear: they, and the thing they wrap, are all leaves of the
same node in the DOM.  That said, it feels strange to have them on their own
lines in _both_ templating systems.

Haml's "Ruby-ness" shines again in various attributes as you can use symbols and
integers as well as strings when building DOM elements.  For example look at the
type of the submit button andthe size of the text input below:

    %input{type: "text", placeholder: "add new todo here", size: 30, ng: {model: "todoText"}}
    %input{class: "btn-primary", type: :submit, value: "add"}

TIL: when building an applet tag, `archive` is a valid attribute name.  Thus
when you want the copy of a link to be "archive" in Slim you must put it on a
separate line preceded by copy indicator such as `|` or `''`.  Haml is not aware
of this attribute.

##### Application Logic

Since we are discussing AngularJS and not Markdown template languages, we should
emphasize the comparison between Javascript and CoffeeScript.  The Javascript
in play here is copied from the [todo example](http://angularjs.org/#todo-js) on
the AngularJS page and is compared to the CoffeeScript translation (done
manually).

Initially using CoffeeScript version 1.3.3 I ran into issues of the syntax not
agreeing with the CoffeeScript syntax guide.  Under 1.6.3 (the most recent in
Homebrew) the code is more reasonable but must be compiled with the `--bare`
option to "compile without a top-level function wrapper".

The translation from JS to CoffeeScript, with a few idiomatic updates, was
extremely smooth and simple.  The implicit return of CoffeeScript makes the
emitted JS read differently than you might expect (since there was only one
`return` statement in the original and there are none in the latter, but six in
the emitted code).

At first glance the use of CoffeeScript is a clear win!

##### Styling

The CSS in the ToDo application was so minimal any comparison with SASS, SCSS,
Less, or any other CSS framework does not have any clear merit.

##### Misc

The use of `bundler` and `guard` in order to get the necessary gems and
auto-compile the various languages during edits was a huge win but it would be
much nicer to just have an auto-updated "preview" mode for each language in vim.
