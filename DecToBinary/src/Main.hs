module Main where

import Data.List (elemIndex)
import System.IO (putStr)

decToBin :: Int -> String
decToBin = decToNumberSystem 2 binCharacters

decToHex = decToNumberSystem 16 hexCharacters

hexCharacters = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F']

binCharacters = ['0', '1']

decToNumberSystem :: Int -> [Char] -> Int -> String
decToNumberSystem base characters number = algorithm number []
  where
    algorithm number parsed
      | number < base = hexCharacters !! number : parsed
      | otherwise = algorithm (number `div` base) ((hexCharacters !! (number `mod` base)) : parsed)

numberSystemToDec :: Int -> [Char] -> String -> Maybe Int
numberSystemToDec base characters number = recursive base characters number $ length number - 1
  where
    recursive _ _ [] _ = Just 0
    recursive base characters number figure = do
      dec <- elemIndex (head number) characters
      rest <- recursive base characters (tail number) (figure - 1)
      return $ rest + (dec * (base ^ figure))
      
numberSystemToNumberSystem :: (String -> Maybe Int) -> (Int -> String) -> String -> Maybe String
numberSystemToNumberSystem numToDec decToOtherNum number = do
    dec <- numToDec number       
    return $ decToOtherNum dec

hexToDec = numberSystemToDec 0x10 hexCharacters
binToDec = numberSystemToDec 2 binCharacters
binToHex bin = numberSystemToNumberSystem binToDec decToHex
hexToBin hex = numberSystemToNumberSystem hexToDec decToBin

main :: IO ()
main = do
  numberString <- getLine
  print $ hexToDec numberString
  main