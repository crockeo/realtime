------
-- Name: Main.hs
-- Author: Crockeo
--
-- Description: 
--

module Main where

import Foreign.C.Types
import System.IO
import Data.Char

import Game

-- Entry point
main :: IO Int
main = start (10, 10)