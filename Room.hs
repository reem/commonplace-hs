module Room (
    Room
  , name
  , description
  , quote
  , monster
  , gates

  , Direction(North, NorthEast, SouthEast, South, SouthWest, NorthWest)
  , GameMap
  , mapRooms
  ) where

import qualified Data.Map
import Quote (Quote)
import Monster (Monster)

data Direction = North | NorthEast | SouthEast | South | SouthWest | NorthWest
                 deriving (Read, Enum, Eq, Show)

data Room = Room {
    name :: String
  , description :: String
  , quote :: Quote
  , monster :: Monster
  , gates :: Data.Map.Map Direction (Maybe Room)
} deriving (Eq)

instance Show Room where
    show r = unlines [name r, "", description r]

newtype GameMap = GameMap {mapRooms :: [Room]} deriving (Show)
