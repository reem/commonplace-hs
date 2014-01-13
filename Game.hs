module Game (
    Game(..)
  , EndGame(..)
  , EndGameType(..)) where

import qualified Player as P
import qualified Room as R

data Game = Game {
    name :: String
  , description :: String
  , player :: P.Player
  , gameMap :: R.GameMap
  , turnCount :: Int
  , menu :: Game -> IO (Either EndGame Game)
}

instance Show Game where
    show g = unlines [name g, "", description g, "", show $ player g]

data EndGameType = PlayerDead | FinalBossDead
newtype EndGame = EndGame EndGameType
