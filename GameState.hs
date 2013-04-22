------
-- Name: GameState.hs
-- Author: Crockeo
--
-- Description: Defining the GameState object.
--

module GameState where

import Direction
import Board

data GameState = GameState { getBoard :: Board, getDirection :: Direction }
                 deriving (Eq, Show, Read)

-- Updating the gamestate
updateGameState :: GameState -> GameState
updateGameState (GameState board direction) = GameState (movePlayer direction board) direction

-- Drawing a gamestate
drawGameState :: GameState -> IO ()
drawGameState gs = drawBoard $ getBoard gs

-- Setting the getBoard element of a GameState
setBoard :: Board -> GameState -> GameState
setBoard board (GameState _ direction) = GameState board direction

-- Setting the getDirection element of a GameState
setDirection :: Direction -> GameState -> GameState
setDirection NoDirection gs = gs
setDirection direction (GameState board _) = GameState board direction