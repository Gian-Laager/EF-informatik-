module Main where

import Data.List 
import System.IO 
import Text.Read

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
binToHex = numberSystemToNumberSystem binToDec decToHex
hexToBin = numberSystemToNumberSystem hexToDec decToBin

convert :: [Char] -> [Char] -> String -> Maybe String
convert "dec" "hex" number = decToHex <$> readMaybe number
convert "dec" "bin" number = decToBin <$> readMaybe number
convert "dec" "dec" number = Just number

convert "hex" "hex" number = Just number
convert "hex" "bin" number = hexToBin number
convert "hex" "dec" number = show <$> hexToDec number

convert "bin" "hex" number = binToHex number
convert "bin" "bin" number = Just number
convert "bin" "dec" number = show <$> binToDec number

convert _ _ _ = Just "Invalid numberSystems"

printMaybeNumber (Just num) = putStrLn num
printMaybeNumber _ = hPutStrLn stderr "Parsing Error!"

main :: IO ()
main = do
  putStrLn "Input number system (dec | hex | bin): "
  inputNumberSystem <- getLine
  putStrLn "Output number system (dec | hex | bin): "
  outputNumberSystem <- getLine
  putStrLn "number to convert: "
  numberString <- getLine
  printMaybeNumber $ convert inputNumberSystem outputNumberSystem numberString
  putStrLn "\n######################################\n"
  main
