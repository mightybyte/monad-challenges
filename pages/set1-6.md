# Threading the random number state

In the last exercise we wrote something that handled the threading of state
through a list of generators.  A simpler idea is to have a function that does
one step of two generators and the necessary state threading.  Now write a
function called genTwo that does this.  Its first argument will be a
generator.  Its second argument will be a function that takes the result of
the first generator and returns a second generator.  The type signature looks
like this:

    genTwo :: Gen a -> (a -> Gen b) -> Gen b

Implement this function.

Now think about this function compared to repRandom from the last exercise.  The
genTwo function takes the output of one generator and passes it to a function
that gives us the next generator.  repRandom can be implemented using this
pattern.  Write another version called repRandomB that uses genTwo to handle
its state threading.

