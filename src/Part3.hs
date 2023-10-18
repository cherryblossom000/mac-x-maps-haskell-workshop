module Part3 where

import Data.List

-- * Task 1

{- |
Maybe is defined like this:
data Maybe a = Nothing | Just a
-}

{- 'safeDiv a b' divides a by b, rounding down (integer division). If the
divisor is 0 it returns Nothing.
Hint: use the div function: 10 `div` 3 == 3
>>> safeDiv 10 5
Just 2
>>> safeDiv 10 3
Just 3
>>> safeDiv 11 3
Just 3
>>> safeDiv 1 0
Nothing
-}
safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv x y = Just (x `div` y)

-- * Task 2

{-
find :: (a -> Bool) -> [a] -> Maybe a
-}

{- | Gets the first even number from a list of integers. If there are no even
numbers in the list, it returns Nothing.
Hint: use the find and even functions
find :: (Int -> Bool) -> [Int] -> Maybe Int
even :: Int -> Bool

>>> findFirstEvenNumber [1, 2, 3, 4]
Just 2
>>> findFirstEvenNumber [1, 3, 5]
Nothing
>>> findFirstEvenNumber []
Nothing
-}
findFirstEvenNumber :: [Int] -> Maybe Int
findFirstEvenNumber xs = find even xs
-- Because all functions in Haskell are curried, this could be simplified (the techincal term is
-- eta-redued) to:
-- findFirstEvenNumber = find even

{-| Returns a string about the first even number in the list.
>>> evenNumberMessage [1, 2, 3, 4]
"The first even number is 2"
>>> evenNumberMessage [1, 3, 5]
"There are no even numbers"
>>> evenNumberMessage []
"There are no even numbers"
-}
evenNumberMessage :: [Int] -> String
evenNumberMessage xs = case findFirstEvenNumber xs of
  Just x -> "The first even number is " <> show x
  Nothing -> "There are no even numbers"
-- If you're curious and want to extend yourself, there's a function called maybe:
-- evenNumberMessage = maybe "There are no even numbers" (("The first even number is " <>) . show) . findFirstEvenNumber

-- * Task 3

data Expression
  = Number Double
  | Negate Expression
  | Add Expression Expression
  | Subtract Expression Expression
  | Multiply Expression Expression
  | Divide Expression Expression
  | Power Expression Expression
  -- the Eq means we can check if two expressions are equal, and the Show means
  -- we can convert an expression to a string (useful for debugging)
  deriving (Eq, Show)


{-| Recursively evaluates an expression.
>>> evaluateExpression $ Number 1
1.0
>>> evaluateExpression $ Add (Number 1) (Number 2)
3.0
>>> evaluateExpression $ Subtract (Number 1) (Number 2)
-1.0
>>> evaluateExpression $ Power (Number 2) (Number 3)
8.0
>>> evaluateExpression $ Multiply (Add (Number 1) (Power (Number 2) (Number 3))) (Negate (Divide (Number 3) (Number 4))) -- (1 + 2 ^ 3) * -(3 / 4)
-6.75
-}
evaluateExpression :: Expression -> Double
evaluateExpression (Number n) = n
evaluateExpression (Negate e) = -evaluateExpression e
evaluateExpression (Add a b) = evaluateExpression a + evaluateExpression b
evaluateExpression (Subtract a b) = evaluateExpression a - evaluateExpression b
evaluateExpression (Multiply a b) = evaluateExpression a * evaluateExpression b
evaluateExpression (Divide a b) = evaluateExpression a / evaluateExpression b
evaluateExpression (Power a b) = evaluateExpression a ** evaluateExpression b
