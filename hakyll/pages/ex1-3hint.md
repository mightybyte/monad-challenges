---
title: First Generalization Hint
---

All three of these functions are simply a call to rand followed by applying a
function to the integer it returns.  What you ultimately need is a function
that you can pass a `Gen a` to and will transform the result.

