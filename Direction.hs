------
-- Name: Direction.hs
-- Author: Crockeo
--
-- Description: Defining the Direction datatype.
--

module Direction where

data Direction = Upwards | Downwards | Leftwards | Rightwards

-- Converting a Direction to a (Int, Int)
toPoint :: Direction -> (Int, Int)
toPoint Upwards = (0, -1)
toPoint Downwards = (0, 1)
toPoint Leftwards = (-1, 0)
toPoint Rightwards = (1, 0)