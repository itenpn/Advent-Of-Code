import Data.Map
import qualified Data.List as L
import System.IO

main = do
  --open the file
  contents <- readFile "data.txt"
  --parse file into a list of characters and times they occur
  let x = Prelude.map frequency $ L.lines contents
  --create array of when each string has exactly two or three the same
  let a = length $ Prelude.filter (>= 1) $ Prelude.map exactTwo x
  let b = length $ Prelude.filter (>= 1) $ Prelude.map exactThree x
  --find the checksum
  let ans = a * b
  print ans
  --find the similarities between the two common strings
  let pos = findpos $ L.lines contents
  print pos

--Converts an array of strings into an array of tuples
--that shows the char and the number of occurances
frequency :: (Ord a) => [a] -> [(a, Int)]
frequency xs = toList (fromListWith (+) [(x,1) | x <- xs])

--checks if the char occurs twice
exactTwo :: (Ord a) => [(a, Int)] -> Int
exactTwo [] = 0
exactTwo (x:xs) = val + exactTwo xs
  where val = if snd x == 2 then 1 else 0

--checks if the char occurs three times
exactThree :: (Ord a) => [(a, Int)] -> Int
exactThree [] = 0
exactThree (x:xs) = val + exactThree xs
  where val = if snd x == 3 then 1 else 0

--finds any values that are different
different :: (Ord a) => [a] -> [a] -> [a]
different x y =  [i | (i , j) <- list, i /= j]
  where list = zip x y

--Goes through list and finds if the two strings have one char different
--then gives me the remaining string
findpos :: [String] -> [Char]
findpos (x:xs)
  | z /= Nothing = [i | (i,j) <- zip x (xs L.!! (\(Just i) -> i) z), i == j]
  | xs == [] = []
  | otherwise = findpos xs
  where z = L.findIndex (== 1) $ Prelude.map length $ Prelude.map (different x) xs
