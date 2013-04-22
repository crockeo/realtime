------
-- Name: Board.hs
-- Author: Crockeo
--
-- Description: Defining the board and related functions.
--

module Board where

import Debug.Trace

import Direction
import Tile
import Math

data Board = Board { getTiles :: [Tile], getWidth :: Int, getHeight :: Int }
             deriving (Eq, Show, Read)

-- Accessing a tile
getTile :: Board -> Int -> Tile
getTile (Board tiles _ _) index = tiles !! index

convertRaw :: (Int, Int) -> Int -> Int
convertRaw (x, y) width = (y * width) + x

-- Converting (x, y) to pos
convert :: (Int, Int) -> Board -> Int
convert pos (Board _ width _) = convertRaw pos width

-- Finding a player in a Board
findPlayer :: Board -> (Int, Int)
findPlayer board
  | notElem Player (getTiles board) = (-1, -1)
  | otherwise = snd $ head res
  where res = take 1 $ filter (\x -> fst x == True) [(getTile board (convert (x, y) board) == Player, (x, y)) | y <- [0..(h - 1)], x <- [0..(w - 1)]]
        w = getWidth board
        h = getHeight board

-- Moving a player in a given direction
movePlayer :: Direction -> Board -> Board
movePlayer direction board = generateBoard (getWidth board, getHeight board) (addPoints (findPlayer board) (toPoint direction))

-- Generating a board with a player at a specified (x, y) coordinate
generateBoard :: (Int, Int) -> (Int, Int) -> Board
generateBoard (w, h) (px, py) = Board [if (x == px && y == py) then Player else Empty | y <- [0..(h - 1)], x <- [0..(w - 1)]] w h

-- Creating a basic board
createBasicBoard :: (Int, Int) -> Board
createBasicBoard (w, h) = generateBoard (w, h) (w `div` 2, h `div` 2)

-- Drawing the board
drawBoard :: Board -> IO ()
drawBoard board = putStr $ toOutputString $ splitTiles (getWidth board) $ getTiles board