------
-- Name: Main.hs
-- Author: Crockeo
--
-- Description: 
--

module Main where

import System.IO
import Input
import Game

-- Entry point
main :: IO Int
main = do
  hSetBuffering stdout NoBuffering
  hSetBuffering stdin NoBuffering

  ret <- start (10, 10)

  clearTerminal
  putStrLn "G'bye!"
  getLine

  return ret