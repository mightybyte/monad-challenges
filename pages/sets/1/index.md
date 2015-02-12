# Monad Challenge Set 1

It may not seem like the problems in this set have much to do with monads at
first, but bear with us.  We are taking you through the motivations for monads
in a step by step structured way.  It may be tempting to skip over this stuff.
DON'T DO IT.  Stick with us and try to absorb the ideas and patterns presented
here.

For all of the problems in this set, use the following language pragmas and
imports:

    {-# LANGUAGE NoImplicitPrelude #-}
    {-# LANGUAGE RebindableSyntax  #-}

    import MCPrelude
    import MCRand

We are giving you a special prelude because we want you to solve these
challenges without the use of monad libraries that have already done the work
for you.  And don't look at the code in Control.Monad, the transformers
package, or the mtl package.  You're doing this to learn.  To do that you need
to struggle with the concepts, so don't cheat yourself out of the benefit you
can get by working through things yourself.

1. [Random number generation](challenges/1.md)
1. [Random character generation](challenges/2.md)
1. [Combining two random generators](challenges/3.md)
1. [Generalizing random pairs](challenges/4.md)
1. [Generalizing lists of generators](challenges/5.md)
1. [Generalizing pairs even more](challenges/6.md)


