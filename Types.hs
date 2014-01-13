module Types (
    GameItem
  , Health
  , Attack
  , Back(..)
  ) where

import Equipment (Equipment)
import Treasure (Treasure)

type GameItem = Either Equipment Treasure

type Health = Integer
type Attack = Integer

data Back = Back deriving (Read, Show)
