------
-- Name: Main.hs
-- Author: Crockeo
--
-- Description: 
--

module Main where

import System.Console.ANSI
import System.IO
import Input
import Game

-- Entry point
main :: IO Int
main = do
  hSetBuffering stdout NoBuffering
  hSetBuffering stdin NoBuffering

  setTitle "Realtime"
  ret <- start (10, 10)

  clearTerminal
  putStrLn "G'bye!"
  getLine

  return ret