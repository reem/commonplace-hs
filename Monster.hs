module Monster (
    Monster
  , name
  , description
  , quote
  , health
  , baseHealth
  , attack
  , monsterDrop
  , monsterType

  , MonsterType(Knight, Giant, Gargantuan, Guardian, Final)
    ) where

import Quote (Quote)
import Types (GameItem, Health, Attack)

data MonsterType = Knight | Giant | Gargantuan | Guardian | Final 
                   deriving (Read, Enum, Eq, Show)

data Monster = Monster {
    name :: String
  , description :: String
  , quote :: Quote
  , health :: Health
  , baseHealth :: Health
  , attack :: Attack
  , monsterDrop :: GameItem
  , monsterType :: MonsterType
} deriving (Eq)

instance Show Monster where
    show m = unlines [name m, "", description m]
