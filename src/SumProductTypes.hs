module SumProductTypes where

type AuthorName = String

data Fiction = Fiction deriving Show

data Nonfiction = Nonfiction deriving Show

data BookType = FictionBook Fiction
              | NonfictionBook Nonfiction
              deriving Show

data Author = Author (AuthorName, BookType)

--data Author = Fiction AuthorName | Nonfiction AuthorName deriving (Eq, Show)
