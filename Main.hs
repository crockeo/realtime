------
-- Name: Main.hs
-- Author: Crockeo
--
-- Description: 
--

module Main where

import Input
import Game

-- Entry point
main :: IO Int
main = do
  ret <- start (10, 10)

  -- A little g'bye message
  clearTerminal
  putStrLn "G'bye!"
  getLine

  return ret