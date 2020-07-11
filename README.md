# The Monad Challenges

The goal of this project is to provide a roadmap for hands-on exploration and
experimentation with monads. It is still rough and there is a fair amount
content that could be added.

## Contribution Guide

The site is a static site generated with
[Hakyll](http://hackage.haskell.org/package/hakyll). To make edits to the text
or to add new sets/exercises, you should edit the markdown files in
[monad-challenges-code/hakyll/pages](https://github.com/mightybyte/monad-challenges/tree/gh-pages/hakyll/pages).

To build, run `nix-build` from the `monad-challenges-code` directory.

To regenerate the HTML, go to the `monad-challenges-code/hakyll` directory and
run `./regen.sh`.

If you want to contribute, but don't know what to do, check out the [open
issues](https://github.com/mightybyte/monad-challenges/issues) and see if you
can help with anything there.
