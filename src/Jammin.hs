module Jammin where

import Data.List (maximumBy, sortBy, groupBy)

data Fruit =
    Peach
  | Plum
  | Apple
  | Blackberry
  deriving (Eq, Show, Ord)

data JamJars =
  Jam { fruit :: Fruit
      , jars :: Int}
  deriving (Eq, Show, Ord)

row1 = Jam Peach 1
row2 = Jam Plum 5
row3 = Jam Apple 10
row4 = Jam Blackberry 15
row5 = Jam Peach 20
row6 = Jam Peach 25
allJam = [row1, row2, row3, row4, row5, row6]

totalJars ::[JamJars] -> Int
totalJars jamJars = sum $ map jars jamJars

compareJars :: JamJars -> JamJars -> Ordering
compareJars (Jam _ n) (Jam _ n') = compare n n'

mostRow :: [JamJars] -> JamJars
mostRow = maximumBy compareJars

compareKind :: JamJars -> JamJars -> Ordering
compareKind (Jam k _) (Jam k' _) = compare k k'

sortJam :: [JamJars] -> [JamJars]
sortJam = sortBy compareKind

equalKind :: JamJars -> JamJars -> Bool
equalKind (Jam k _) (Jam k' _) = k == k'

groupJam :: [JamJars] -> [[JamJars]]
groupJam = (groupBy equalKind) . sortJam

main = do
  putStrLn "hello world"
