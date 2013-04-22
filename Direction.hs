------
-- Name: Direction.hs
-- Author: Crockeo
--
-- Description: Defining the Direction datatype.
--

module Direction where

data Direction = Upwards | Downwards | Leftwards | Rightwards | NoDirection
                 deriving (Eq, Show, Read)

-- Converting a Char to a Direction
toDirection :: Char -> Direction
toDirection 'w' = Upwards
toDirection 's' = Downwards
toDirection 'a' = Leftwards
toDirection 'd' = Rightwards
toDirection c = NoDirection

-- Converting a Direction to a (Int, Int)
toPoint :: Direction -> (Int, Int)
toPoint Upwards = (0, -1)
toPoint Downwards = (0, 1)
toPoint Leftwards = (-1, 0)
toPoint Rightwards = (1, 0)
toPoint NoDirection = (0, 0)