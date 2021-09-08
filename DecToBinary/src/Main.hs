module Main where

import System.IO (putStr)

decToBin number = algorithm number [] where
    algorithm 1 parsed = 1 : parsed
    algorithm 0 parsed = 0 : parsed
    algorithm number parsed = algorithm (number `div` 2) $ (number `mod` 2) : parsed
    
hexCharacters = ['0', '1', '2', '3', '4', '5', '6','7','8','9','A','B','C', 'D','E','F']
    
decToHex :: Int -> String
decToHex number = algorithm number [] where 
    algorithm number parsed | number < 0x10 = hexCharacters !! number : parsed
                            | otherwise = algorithm (number `div` 0x10) ((hexCharacters !! (number `mod` 0x10)) : parsed)

main :: IO ()
main = do
    numberString <- getLine 
    let dec = read numberString :: Int
    putStrLn $ decToHex dec
    main