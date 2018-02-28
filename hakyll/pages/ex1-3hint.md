---
title: First Generalization Hint
---

All three of these functions are conceptually a call to rand followed by
applying a function to the integer it returns. What you ultimately need is a
function that you can pass a `Gen a` to and will transform the result.

Be careful not to make your function too specific to rand. rand is a specific example of a `Gen Integer` but you want your function to work for other kinds of `Gen a` as well.

If you are still stuck, you can view the expected type signature by hex decoding the following string: 67656E6572616C41203A3A202861202D3E206229202D3E2047656E2061202D3E2047656E2062

You can decode it with [this online hex decoder](http://www.convertstring.com/EncodeDecode/HexDecode).

[Back](ex1-3.html)