------
-- Name: Game.hs
-- Author: Crockeo
--
-- Description: Defining overarching game functionality.
--

module Game where

import Control.Concurrent
import Data.IORef

import GameState
import Direction
import Board
import Input

-- Starting the game
start :: (Int, Int) -> IO Int
start size = do
  gsRef <- newIORef $ GameState (createBasicBoard size) Upwards
  doneRef <- newIORef False
  forkIO (inputLoop gsRef doneRef)
  updateLoop gsRef doneRef

-- Stopping the game
stop :: IO Int
stop = return 0

-- Update/draw loop
updateLoop :: IORef GameState -> IORef Bool -> IO Int
updateLoop gsRef doneRef = do
  done <- readIORef doneRef
  if done
    then stop
    else do
      clearTerminal
      (readIORef gsRef) >>= drawGameState

      threadDelay 750000

      modifyIORef gsRef (updateGameState)

      gs <- readIORef gsRef
      if (findPlayer $ getBoard gs) == (-1, -1)
        then writeIORef doneRef True
        else writeIORef doneRef False

      updateLoop gsRef doneRef

-- Input loop
inputLoop :: IORef GameState -> IORef Bool -> IO ()
inputLoop gsRef doneRef = do
  done <- readIORef doneRef
  if done
    then return ()
    else do
      input <- getCharNoEnter
      handleInput gsRef (input)
      inputLoop gsRef doneRef

-- Handling input
handleInput :: IORef GameState -> Char -> IO ()
handleInput gsRef input = modifyIORef gsRef (setDirection (toDirection input))