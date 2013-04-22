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