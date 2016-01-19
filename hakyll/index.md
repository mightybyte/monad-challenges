---
title: The Monad Challenges
---

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
* Type aliases
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


### Getting Started

First clone the monad-challenges github repository and build the associated
library.

    git clone https://github.com/mightybyte/monad-challenges.git
    cd monad-challenges
    cabal install

This makes the MCPrelude module available on your system. Now head on over to
[Set 1](pages/set1.html) and start coding!