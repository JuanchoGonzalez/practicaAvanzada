-- ej 1)

merge :: (Ord a) => [a] -> [a] -> [a]
merge [] ys = ys
merge (x:xs) [] = x:xs
merge (x:xs) (y:ys) | (x <= y) = x:merge xs (y:ys) 
                    | otherwise = y:merge (x:xs) ys

-- ej 2)

{-
ordList :: [a] -> [a]
ordList [] = []
ordList xs = minimum xs:ordList (sacarMinimo xs)   


sacarMinimo :: (Ord a) => [a] -> [a]
sacarMinimo []       = []
sacarMinimo (x:y:xs) | (minimum xs == x) = (y:xs)        
                     | (minimum xs == y) = (x:xs) 
                     | otherwise = sacarMinimo xs
-}

-- ej 3) 

dosAlaN :: Int -> Int
dosAlaN 0 = 1
dosAlaN n = 2 * dosAlaN (n-1)          

-- ej 4) 

binario :: Int -> [Int]
binario 0 = [0]
binario 1 = [1]
binario n | mod n 2 == 0 = binario (div n 2) ++ [0]
          | otherwise = binario (div n 2) ++ [1]

-- ej 5)

parBinario :: [Int] -> Bool
parBinario xs = if (last xs == 0) then True else False

-- ej 6)

hamming :: (Eq a) => [a] -> [a] -> Int
hamming [] ys = 0
hamming (x:xs) [] = 0
hamming (x:xs) (y:ys) | (x /= y) = 1 + hamming xs ys 
                      | otherwise = hamming xs ys

-- ej 7)
{-
esCuadradoPerf :: (Num a) => a -> Bool
esCuadradoPerf n = ((sqrt n) == esEntero n)
-}

-- 49 --  
-- 

-- ej 8) 

repet :: a -> Int -> [a]
repet _ 0 = []
repet z n = z:repet z (n-1)

-- ej 9)

nelem :: [a] -> Int -> a
nelem [] _ = error "No tiene sentido"
nelem (x:xs) 0 = x
nelem (x:xs) n = nelem xs (n-1)    

-- ej 10)
{-
posicionesC :: (Eq a) => [a] -> a -> [Int]
posicionesC [] _ = []
posicionesC (x:xs) c | (x == c) = (nelem xs ):posicionesC xs c
                     | otherwise = posicionesC xs c 
-}
-- "catamarca" ´a´ = [1,3,5,8]
-- c = a , no entonces posicionesC "atamarca" ´a´
-- a = a , si entonces 1:"tamarca" ´a´
-- t = a , no entonces "amarca" ´a´
-- 

-- ej 11) 

compact :: (Eq a) => [a] -> [a] 
compact [] = []
compact [x] = [x]
compact (x:y:xs) | x == y = y:compact xs
                 | otherwise = x:compact (y:xs)  
