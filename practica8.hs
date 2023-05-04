nand :: Bool -> Bool -> Bool
nand True True = False
nand _ _ = True 

maj :: Bool -> Bool -> Bool -> Bool
maj True True _ = True
maj True _ True = True
maj _ True True = True
maj _ _ _       = False

existe :: [Int] -> [a] -> (Int -> [a] -> Bool)-> Bool
existe xs ys f = or [f x | x <- xs]

paraTodo :: [Int] -> [a] -> (Int -> [a] -> Bool)-> Bool
paraTodo xs ys f = and [f x | x <- xs]

f :: [a] -> Bool


