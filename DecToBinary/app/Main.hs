module Main where

import Lib
import System.IO (putStr)
import GHC.IO (evaluate)

decToHex number = algorithm number [] where
    algorithm 1 parsed = 1 : parsed
    algorithm 0 parsed = 0 : parsed
    algorithm number parsed = algorithm (number `div` 2) $ (number `mod` 2) : parsed

main :: IO ()
main = do
    numberString <- getLine
    let dec = read numberString :: Int
    print $ decToHex dec
    main