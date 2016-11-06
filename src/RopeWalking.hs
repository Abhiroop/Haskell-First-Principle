module RopeWalking where

type Birds = Int

type Pole = (Birds, Birds)

-- Before Monads
--landLeft :: Birds -> Pole -> Pole  
--landLeft n (left,right) = (left + n,right)  
  
--landRight :: Birds -> Pole -> Pole  
--landRight n (left,right) = (left,right + n) 

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
  | abs ((n + left) - right) < 4 = Just (n + left, right)
  | otherwise                    = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
  | abs (left - (n + right)) < 4 = Just (left, n + right)
  | otherwise                    = Nothing

-- Beautifully monadic
--return (0,0) >>= landLeft 1 >>= landRight 4 >>= landLeft (-1) >>= landRight (-2)

routine :: Maybe Pole  
routine = do  
    start <- return (0,0)  
    first <- landLeft 2 start  
    second <- landRight 2 first  
    landLeft 1 second  

