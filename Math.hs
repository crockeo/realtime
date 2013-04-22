------
-- Name: Math.hs
-- Author: Crockeo
--
-- Description: Defining some mathematical functions.
--

module Math where

-- Adding two (Int, Int)s together to create a result
addPoints :: (Int, Int) -> (Int, Int) -> (Int, Int)
addPoints (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)