# Creating Instances

Now you have a Monad type class with two functions: bind and return.  If
you've heard anything about monads in the past, this might sound familiar.
But don't go off and look at existing monad code yet.  You have a lot more
ground to discover yourself.

The next thing you need to do is create instances of your Monad type class for
Maybe and Gen.  You can do this for Maybe with no trouble.  But Gen won't work
because it is a type alias.  First you need to replace your type alias with a
newtype.  Don't go back and modify your old code.  We'll be referring back to
that in the future.  Do this work in a new file Set3.hs (again importing
MCPrelude instead of Haskell'l prelude).  You can import Set2
because that has all your Maybe code which can be reused.  But don't import
Set1.  When you are finished with this challenge you should have a Set3 file
with a Monad type class, a Gen newtype, and two instances.

If you did all the exercises properly this should be pretty straightforward.
