module Game (
    Game
  , name
  , description
  , player
  , gameMap
    ) where

import Player (Player)
import Room (GameMap)

data Game = Game {
    name :: String
  , description :: String
  , player :: Player
  , gameMap :: GameMap
} deriving (Show)
