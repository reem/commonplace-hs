module Treasure (
    Treasure
  , name
  , description
  , quote
    ) where

import Quote (Quote)

data Treasure = Treasure {
    name :: String
  , description :: String
  , quote :: Quote
} deriving (Eq)

instance Show Treasure where
    show t = unlines [name t, "", description t]
