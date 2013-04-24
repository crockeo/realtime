------
-- Name: Input.hs
-- Author: Crockeo
--
-- Description: Input utilities
--

module Input where

import System.Process

-- Clearing the terminal
clearTerminal :: IO ()
clearTerminal = do
  system "cls"
  return ()