---
title: The Monad Challenges
---

<div class="notice">

### Work In Progress

There are still some rough edges here, and also a fair amount of content to be
added. But if we waited until everything was polished before publishing, it
would probably never happen. So feel free to make comments, suggestions, or
contribute new content. As always, pull requests are the most desirable.

Bottom line: **we need more contributors**. If you would like to help, see the
[contribution
guide](https://github.com/mightybyte/monad-challenges/blob/gh-pages/README.md)
for more information.

</div>

## Welcome

The guys who wrote the [matasano crypto challenges](http://cryptopals.com/)
realized that you cannot get a working knowledge of crypto without investing
blood, sweat, and tears into playing with and attempting to break crypto.
They even say, "But more people 'know how' to break it than can actually break
it."  Their crypto challenges provide a structured way for people to make the
requisite blood, sweat, and tears investment to get to a place of
understanding.

We believe the same is true when learning monads.  Monads cannot be taught.
They must be _discovered_.  The problem with monad tutorials is that they are
predicated on someone teaching/explaining monads.  But you must explore them
yourself.  You will never really understand monads until you do this.  The
problem is that beginners do not usually know how to explore.  We put together
this set of challenges to show you how to do that.

_Please do NOT publish the answers to these challenges._  Reading answers that
you did not create yourself defeats the whole purpose.

### Do I need to know category theory?

No.

### Do I need to know Haskell?

Yes, we assume that you have some beginner "pre-monad" level knowledge of
the following Haskell concepts:

* Basic syntax
* Type signatures
* Higher order functions
* Type synonyms
* newtypes
* Polymorphism
* Type classes

We are not trying to teach you Haskell here. We are trying to guide you down the
path to a fully internalized working knowledge of monads. If you need to learn
Haskell, go work through some beginning Haskell materials and come back when you
think you need to learn monads.

### Organizing Your Code

It will probably help if you organize your code into one file per set of
challenges.  Some of the problem sets build on previous ones, so it will be
convenient to be able to easily import your code for a whole set or find it
for reference.

### Who did this?

* Doug Beardsley (with feedback and suggestions from Brent Yorgey)

### Code Template

For all of these problem sets you should use the following language pragmas
and imports:

    {-# LANGUAGE MonadComprehensions #-}
    {-# LANGUAGE RebindableSyntax  #-}

    module Set1 where

    import MCPrelude

MCPrelude should be the only module you import.  Do not import any other
modules.  We are giving you a special prelude because we want you to solve
these challenges without the use of monad libraries that have already done the
work for you.  Also, don't look at the code in Control.Monad, the transformers
package, or the mtl package.  You're doing this to learn.  To do that you need
to struggle with the concepts.  Don't cheat yourself out of the benefit you
can get by working through things yourself.

Many of the problem sets build on things you did in previous sets, so you may
want to put all your code for each set into a single module to make it easier
to reuse your previous work.  In later sets you will probably want to go back
and look at your code for each set to find similarities.

### Getting Started

First clone the monad-challenges github repository and build the associated
library.

    git clone https://github.com/mightybyte/monad-challenges.git
    cd monad-challenges
    cabal install

This makes the MCPrelude module available on your system. Now head on over to
[Set 1](pages/set1.html) and start coding!

Once you've written some code, the easiest way to test it is to use Haskell's
REPL, `ghci`.

    ghci Set1.hs

You can inspect symbols you've written just by typing them in `ghci`.

    $ ghci Set1.hs
    GHCi, version 7.10.2: http://www.haskell.org/ghc/  :? for help
    [1 of 1] Compiling Set1             ( Set1.hs, interpreted )
    Ok, modules loaded: Set1.
    *Set1> fiveRands
    [33614,564950498,1097816499,1969887316,140734213]
    *Set1>

You can also type `:r` to reload Set1.hs after you make code changes.
(Note that the above numbers are not the correct answer for fiveRands.)

### Hex Decoding

Some challenges include hex encoded hints if you get stuck.  You can put "hex
decoder" into your favorite search engine to find numerous web pages that will
do the decoding for you.  Or you can use this bit of Haskell:

    import Numeric (readHex)
    import Data.List.Split (chunksOf)

    hexDecode :: String -> String
    hexDecode = map (toEnum . fst . head . readHex) . (chunksOf 2)
