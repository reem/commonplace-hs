module Types (
    GameItem
  , Health
  , Attack
  ) where

import Equipment (Equipment)
import Treasure (Treasure)

type GameItem = Either Equipment Treasure

type Health = Integer
type Attack = Integer
