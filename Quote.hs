module Quote (
    Quote
  , text
  , author
  , category

  , Category(CSSM, IE, SCW, DPCW, TPW)
  ) where

data Category = CSSM | IE | SCW | DPCW | TPW
                deriving (Read, Enum, Eq, Show)

data Quote = Quote {
    text :: String
  , author :: String
  , category :: Category
} deriving (Eq)

instance Show Quote where
    show q = unlines [text q, "    -- " ++ author q]
