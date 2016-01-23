{-# LANGUAGE Trustworthy #-}
{-# LANGUAGE CPP, NoImplicitPrelude, BangPatterns #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  MCPrelude
-- Copyright   :  (c) The University of Glasgow 2001
-- License     :  BSD-style (see the file libraries/base/LICENSE)
-- 
-- Maintainer  :  mightybyte@gmail.com
-- Stability   :  stable
-- Portability :  portable
--
-- MCPrelude is a modified version of the Haskell Prelude designed
-- specifically for The Monad Challenges.
--
-----------------------------------------------------------------------------

module MCPrelude (

    -- * Standard types, classes and related functions

    -- ** Basic data types
    Bool(False, True),
    (&&), (||), not, otherwise,

    Ordering(LT, EQ, GT),
    Char, String,

    ifThenElse,

    -- *** Tuples
    fst, snd, curry, uncurry,

    -- ** Basic type classes
    Eq((==), (/=)),
    Ord(compare, (<), (<=), (>=), (>), max, min),
    Enum(succ, pred, toEnum, fromEnum, enumFrom, enumFromThen,
         enumFromTo, enumFromThenTo),
    Bounded(minBound, maxBound),

    -- ** Numbers

    -- *** Numeric types
    Int, Integer, Float, Double,
    Rational,

    -- *** Numeric type classes
    Num((+), (-), (*), negate, abs, signum, fromInteger),
    Real(toRational),
    Integral(quot, rem, div, mod, quotRem, divMod, toInteger),
    Fractional((/), recip, fromRational),
    Floating(pi, exp, log, sqrt, (**), logBase, sin, cos, tan,
             asin, acos, atan, sinh, cosh, tanh, asinh, acosh, atanh),
    RealFrac(properFraction, truncate, round, ceiling, floor),
    RealFloat(floatRadix, floatDigits, floatRange, decodeFloat,
              encodeFloat, exponent, significand, scaleFloat, isNaN,
              isInfinite, isDenormalized, isIEEE, isNegativeZero, atan2),

    -- *** Numeric functions
    subtract, even, odd, gcd, lcm, (^), (^^),
    fromIntegral, realToFrac,

    -- ** Miscellaneous functions
    id, const, (.), flip, ($), until,

    -- * List operations
    map, (++), filter,
    null, length, (!!),
    reverse,
    -- ** Reducing lists (folds)
    foldl, foldl1, foldr, foldr1,
    -- *** Special folds
    and, or, any, all,
    product, sum,
    concat, concatMap,
    -- ** Building lists
    -- *** Scans
    scanl, scanl1, scanr, scanr1,
    -- *** Infinite lists
    iterate, repeat, replicate, cycle,
    -- ** Sublists
    take, drop, splitAt, takeWhile, dropWhile, span, break,
    -- ** Searching lists
    elem, notElem,
    -- ** Zipping and unzipping lists
    zip, zip3, zipWith, zipWith3, unzip, unzip3,
    -- ** Functions on strings
    lines, words, unlines, unwords,

    -- * Converting to and from @String@
    -- ** Converting to @String@
    ShowS,
    Show(showsPrec, showList, show),
    shows,
    showChar, showString, showParen,
    -- ** Converting from @String@
    ReadS,
    Read(readsPrec, readList),
    reads, readParen, read, lex,
    undefined,

    Seed,
    mkSeed,
    rand,
    toLetter,

    GreekData,
    greekDataA,
    greekDataB,
    salaries,
    firstNames,
    lastNames,
    cardRanks,
    cardSuits

  ) where

import Data.Char
import Data.List
import Data.Tuple

import GHC.Base hiding (foldr)
import GHC.Enum
import GHC.Num
import GHC.Real
import GHC.Float
import GHC.Show
import Prelude (undefined)
import Text.Read

infixr 0 $!

ifThenElse :: Bool -> a -> a -> a
ifThenElse True a _ = a
ifThenElse False _ a = a

-- -----------------------------------------------------------------------------
-- Miscellaneous functions

-- | Strict (call-by-value) application, defined in terms of 'seq'.
($!)    :: (a -> b) -> a -> b
f $! x  = let !vx = x in f vx  -- see #2273

#ifdef __HADDOCK__
-- | The value of @'seq' a b@ is bottom if @a@ is bottom, and otherwise
-- equal to @b@.  'seq' is usually introduced to improve performance by
-- avoiding unneeded laziness.
seq :: a -> b -> b
seq _ y = y
#endif

newtype Seed = Seed { unSeed :: Integer }
  deriving (Eq,Show)

mkSeed :: Integer -> Seed
mkSeed n = Seed n

m :: Integer
m = 0x7FFFFFFF

rand :: Seed -> (Integer, Seed)
rand (Seed s) = (s', Seed s')
  where
    s' = (s * 16807) `mod` m

toLetter :: Integer -> Char
toLetter = chr . (ord 'a' + ) . (`mod` 26) . fromIntegral

type GreekData = [(String, [Integer])]

greekDataA :: GreekData
greekDataA = [ ("alpha", [5, 10])
             , ("beta", [0, 8])
             , ("gamma", [18, 47, 60])
             , ("delta", [42])
             ]

greekDataB :: GreekData
greekDataB = [ ("phi", [53, 13])
             , ("chi", [21, 8, 191])
             , ("psi", [])
             , ("omega", [6, 82, 144])
             ]

salaries :: [(String, Integer)]
salaries = [ ("alice", 105000)
           , ("bob", 90000)
           , ("carol", 85000)
           ]

firstNames :: [String]
firstNames = ["alice", "bob", "carol", "dave"]

lastNames :: [String]
lastNames = ["doe", "jones", "smith"]

cardRanks :: [Int]
cardRanks = [2, 3, 4, 5]

cardSuits :: [String]
cardSuits = ["H", "D", "C", "S"]

