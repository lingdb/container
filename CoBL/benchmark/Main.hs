module Main where

import Control.Monad
import Data.Function (on)
import Data.List
import System.Environment (getArgs)

avg :: [Double] -> Double
avg xs = sum xs / fromIntegral (length xs)

median :: [Double] -> Double
median [x] = x
median (x:y:[]) = avg [x,y]
median xs = median $ init $ tail xs

main :: IO ()
main = do
  fileName <- liftM head getArgs
  file <- readFile fileName
  let times = sort $ map read $ lines file
      ls = [
          "Minimum: "++show (head times)
        , "Maximum: "++show (last times)
        , "Average: "++show (avg times)
        , "Median:  "++show (median times)
        ]
  putStrLn $ unlines ls
