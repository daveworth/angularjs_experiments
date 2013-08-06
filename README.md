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

In the Hello World example there was no external Javascript so the only
comparison is HTML vs. Haml vs. Slim but the three showed their strengths
immediately:

The HTML version is the baseline and is copied directly from the [first
example](http://angularjs.org/#hello-html) on the AngularJS website.

Slim and Haml are both elegant in their use of whitespace delimiters instead of
closing tags.  The Haml version ended up being the exact same length as the Slim
version.  The major difference is in the (elegant IMO) way that Haml handles
data-attributes.  In Haml data-attributes are treated as a nested-hash a-la Ruby
e.g. `%some_tag{class: "magic", data: {attr1: "val1", attr2: "val2"}}` produces
`<some_tag class="magic" data-attr1="val1" data-attr2="val2">`.  In the case of
data-attributes this feels fairly natural but in the case of Angular attributes
the pattern `%some_tag{ng: {attr: "val"}}` feels less natural than Slim's
syntax which mirrors HTML almost exactly (e.g. `some_tag ng-attr="val"`).  This
may change, and the Haml syntax may feel better if later multiple Angular
attributes are passed to a single tag.
