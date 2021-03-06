{-# LANGUAGE FlexibleInstances #-}

module AlgebraicDatatypes where

data Price = Price Integer deriving (Eq,Show)

data Manufacturer = Mini | Mazda | Tata deriving (Eq,Show)

data Airline = PapuAir | CatapaultsAir | TakeYourChancesUnited deriving (Eq,Show)

data Size = Size Integer deriving (Eq, Show)

data Vehicle = Car Manufacturer Price | Plane Airline Size deriving (Eq,Show)

myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir (Size 10)

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _ = False

areCars :: [Vehicle] -> [Bool]
areCars vehicles = map isCar vehicles 

getManu :: Vehicle -> Maybe Manufacturer
getManu (Car manu  _) = Just manu
getManu _ = Nothing

class TooMany a where
  tooMany :: a -> Bool
instance TooMany (Int, String) where
  tooMany (n, _) = n > 42

--------------------------------------------------

newtype Group = Group (Int, Int) deriving Show

instance TooMany Group where
  tooMany (Group (m, n)) = m + n > 42
  
--------------------------------------------------------

instance (Num a, TooMany a) => TooMany (a, a) where
  tooMany (x, y) = tooMany $ x + y

main = do
  putStrLn "hello world"
