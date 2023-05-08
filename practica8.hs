nand :: Bool -> Bool -> Bool
nand True True = False
nand _ _ = True 

maj :: Bool -> Bool -> Bool -> Bool
maj True True _ = True
maj True _ True = True
maj _ True True = True
maj _ _ _       = False

existe :: [Int] -> [Int] -> (Int -> [Int] -> Bool)-> Bool
existe xs ys f = or [odd x | x <- ys]
{-
paraTodo :: [Int] -> [a] -> (Int -> [a] -> Bool)-> Bool
paraTodo xs ys f = and [f x | x <- ys]
-}

f :: Int -> [Int] -> Bool
f n [] = False
f n (x:xs) | mod x 2 /= 0 = True   
           | otherwise = False


