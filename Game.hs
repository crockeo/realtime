------
-- Name: Game.hs
-- Author: Crockeo
--
-- Description: Defining overarching game functionality.
--

module Game where

import GameState
import Direction
import Board

-- Starting the game
start :: (Int, Int) -> IO Int
start (w, h) = do
  undefined

-- Stopping the game
stop :: IO Int
start = return 0