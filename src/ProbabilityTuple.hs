module ProbabilityTuple where

import Data.Ratio
import Control.Applicative 
import Control.Monad (liftM, ap)
  
newtype Prob a = Prob { getProb :: [(a,Rational)] } deriving Show

instance Functor Prob where
  fmap f (Prob xs) = Prob $ map (\(x,p) -> (f x,p)) xs

flatten :: Prob (Prob a) -> Prob a
flatten (Prob xs) = Prob $ concat $ map multAll xs  
    where multAll (Prob innerxs,p) = map (\(x,r) -> (x,p*r)) innerxs

instance Applicative Prob where
  pure  = return
  (<*>) = ap

instance Monad Prob where  
    return x = Prob [(x,1%1)]  
    m >>= f = flatten (fmap f m)  
    fail _ = Prob []  
