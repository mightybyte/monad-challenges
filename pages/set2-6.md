# Tailprod

Write a function that takes the product of the tail of a list.  Use your
tailMay function and the product function defined in the prelude.

    tailProd :: Num a => [a] -> Maybe a

Now write a similar but slightly different function:

    tailSum :: Num a => [a] -> Maybe a

These two functions have a lot in common.  See if you can abstract out the
commonality.  You need to write another function that is the generalized
version of both of these.  Spend some time working on this before you look at
the next hint:

    7472616E734D61796265203A3A202861202D3E206229202D3E204D617962652061202D3E204D617962652062

Write a function with that type signature and then go back and implement
tailProd and tailSum in terms of that function.

Now that you have that finished, write two more functions that are similar,
but slightly different:

    tailMax :: Ord a => [a] -> Maybe a
    tailMin :: Ord a => [a] -> Maybe a


