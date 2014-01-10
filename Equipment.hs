module Equipment (
    Equipment
  , name
  , description
  , quote
  , healthBoost
  , attackBoost
  , equipmentType

  , EquipmentType(Helmet, Armor, Shield, Sword, Ring)
    ) where

import Quote (Quote)

-- import Types (Health, Attack)
-- Here to avoid an import cycle.
type Health = Integer
type Attack = Integer

data EquipmentType = Helmet | Armor | Shield | Sword | Ring 
                     deriving (Read, Enum, Eq, Show)

data Equipment = Equipment {
    name :: String
  , description :: String
  , quote :: Quote
  , healthBoost :: Health
  , attackBoost :: Attack
  , equipmentType :: EquipmentType
} deriving (Eq)

instance Show Equipment where
    show e = unlines [name e, "", description e]
