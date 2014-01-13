module Main where

import Generate (genGame)
import Play (playGame)

main :: IO ()
main = do
    game <- genGame
    playGame game
