------
-- Name: Input.hs
-- Author: Crockeo
--
-- Description: Input utilities
--

module Input where

import Foreign.C.Types
import System.Process
import Data.Char

-- Getting a character from the input stream without waiting for a press of the ENTER key
{-# LANGUAGE ForeignFunctionInterface #-}
getCharNoEnter :: IO Char
getCharNoEnter = fmap (chr.fromEnum) c_getch
foreign import ccall unsafe "conio.h getch"
  c_getch :: IO CInt

-- Clearing the terminal
clearTerminal :: IO ()
clearTerminal = do
  system "cls"
  return ()