module Room (
    Room(..)
  , Direction(..)
  , GameMap(..)
  ) where

import Quote (Quote)
import Monster (Monster)

data Direction = North | NorthEast | SouthEast | South | SouthWest | NorthWest
                 deriving (Read, Enum, Eq, Show)

data Room = Room {
    name :: String
  , description :: String
  , quote :: Quote
  , monster :: Maybe Monster
  , gates :: [(Direction, Maybe Integer)]
} deriving (Eq)

instance Show Room where
    show r = unlines [name r, "", description r]

data GameMap = GameMap {
    mapRooms :: [Room]
  , currentRoom :: Integer
} deriving Show
