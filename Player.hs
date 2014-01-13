module Player (
    Player(..)
  , Equipped
  , maxHealth
  , attack
    ) where

import Types(GameItem, Health, Attack)
import qualified Equipment as Eq

type Equipped = [(Eq.EquipmentType, Maybe Eq.Equipment)]

data Player = Player {
    name :: String
  , description :: String
  , health :: Health
  , baseHealth :: Health
  , baseAttack :: Attack
  , inventory :: [GameItem]
  , equipped :: Equipped
} deriving (Eq)

instance Show Player where
    show p = unlines [name p, "", description p]

maxHealth :: Player -> Health
maxHealth p = baseHealth p + healthBoost (equipped p)

healthBoost :: Equipped -> Health
healthBoost eq = foldr hsum 0 eq'
    where
        eq' :: [Maybe Eq.Equipment]
        eq' = map snd eq
        hsum :: Maybe Eq.Equipment -> Health -> Health
        hsum (Just e) a = a + Eq.healthBoost e
        hsum Nothing a = a

attack :: Player -> Attack
attack p = baseAttack p + attackBoost (equipped p)

attackBoost :: Equipped -> Attack
attackBoost eq = foldr asum 0 eq'
    where
        eq' :: [Maybe Eq.Equipment]
        eq' = map snd eq
        asum :: Maybe Eq.Equipment -> Attack -> Attack
        asum (Just e) a = a + Eq.attackBoost e
        asum Nothing a = a
