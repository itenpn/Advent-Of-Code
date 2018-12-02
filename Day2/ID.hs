import Data.Map
import qualified Data.List as L
import System.IO

main = do
  contents <- readFile "data.txt"
  let x = Prelude.map frequency $ L.lines contents
  let a = length $ Prelude.filter (>= 1) $ Prelude.map exactTwo x
  let b = length $ Prelude.filter (>= 1) $ Prelude.map exactThree x
  let ans = a * b
  print ans
  let pos = findpos $ L.lines contents
  print pos

frequency :: (Ord a) => [a] -> [(a, Int)]
frequency xs = toList (fromListWith (+) [(x,1) | x <- xs])

exactTwo :: (Ord a) => [(a, Int)] -> Int
exactTwo [] = 0
exactTwo (x:xs) = val + exactTwo xs
  where val = if snd x == 2 then 1 else 0

exactThree :: (Ord a) => [(a, Int)] -> Int
exactThree [] = 0
exactThree (x:xs) = val + exactThree xs
  where val = if snd x == 3 then 1 else 0

similar :: (Ord a) => [a] -> [a] -> [a]
similar x y =  [i | (i , j) <- list, i /= j]
  where list = zip x y

findpos :: [String] -> [Char]
findpos (x:xs)
  | z /= Nothing = [i | (i,j) <- zip x (xs L.!! (\(Just i) -> i) z), i == j]
  | xs == [] = []
  | otherwise = findpos xs
  where z = L.findIndex (== 1) $ Prelude.map length $ Prelude.map (similar x) xs
