module Play (
    playGame
  , GameReturn
  , prompt ) where

import qualified Data.List as L
import qualified Game as G

type GameReturn = Either G.EndGame G.Game

playGame :: G.Game -> IO ()
playGame game = do
    putStrLn $ G.name game
    putStrLn "\n"
    putStrLn $ G.description game
    putStrLn "\n"
    playTurns game

playTurns :: G.Game -> IO ()
playTurns game = do
    ptResult <- playTurn game
    case ptResult of
        Right game'      -> playTurns game'
        Left (G.EndGame a) -> case a of
            G.PlayerDead       -> lost
            G.FinalBossDead    -> won

playTurn :: G.Game -> IO (Either G.EndGame G.Game)
playTurn game = do
    putStrLn $ "Turn: " ++ show (G.turnCount game)
    G.menu game game

lost :: IO ()
lost = do
    putStrLn "You have been killed\n"
    putStrLn "If at first you don't succeed, call it version 1.0."
    putStrLn "    -- Unknown"

won :: IO ()
won = do
    putStrLn ""
    putStrLn "Impossible is just a big word thrown around by small men"
    putStrLn "who find it easier to live in the world they've been given"
    putStrLn "than to explore the power they have to change it."
    putStrLn ""
    putStrLn "Impossible is not a fact - it's an opinion. Impossible is not"
    putStrLn "a declaration - it's a dare. Impossible is potential."
    putStrLn "Impossible is temporary. Impossible is nothing."
    putStrLn ""
    putStrLn "    -- Muhammad Ali"

prompt :: [String] -> IO String
prompt opt = do
    putStrLn $ "What would you like to do? " ++ format opt
    choice <- getLine
    if choice `elem` opt
    then return choice
    else do
        putStrLn $ choice ++ " is not an option. Please choose again."
        prompt opt
  where
    format :: [String] -> String
    format s = "(" ++ L.intercalate "/" s ++ ")"
