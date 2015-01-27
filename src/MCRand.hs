{-# LANGUAGE NoImplicitPrelude #-}

module MCRand
  ( Seed
  , mkSeed
  , rand
  ) where

import MCPrelude

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

