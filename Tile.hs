------
-- Name: Tile.hs
-- Author: Crockeo
--
-- Description: Defining Tile types, and related functions.
--

module Tile where

data Tile = Player | Empty
            deriving (Eq, Show, Read)

-- Converting a Tile to a Char
toChar :: Tile -> Char
toChar Player = '#'
toChar Empty = '.'

-- Converting a [Tile] to a String
toString :: [Tile] -> String
toString tiles = map (toChar) tiles

-- Converting a [[Tile]] to a [String]
toStrings :: [[Tile]] -> [String]
toStrings tiless = map (toString) tiless

-- Converting a [[Tile]] to a String meant for output
toOutputString :: [[Tile]] -> String
toOutputString tiless = unlines $ toStrings tiless

-- Splittnig a [Tile] to a [[Tile]] with each [Tile] within it of length n (optimally)
splitTiles :: Int -> [Tile] -> [[Tile]]
splitTiles _ [] = []
splitTiles width tiles =
  (fst tsplit) : (splitTiles width $ snd tsplit)
  where tsplit = splitAt width tiles