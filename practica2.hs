hd1 :: [a] -> a
hd1 (x:xs) = x 

tl1 :: [a] -> [a]
tl1 [] = []
tl1 (x:xs) = xs
 
last1 :: [a] -> a
last1 xs = hd1 (reverse xs)  

init1 :: [a] -> [a]
init1 [x] = []
init1 (x:xs) = x:init1 xs

--3

maxTres :: Int -> Int -> Int -> Int
maxTres x y z | (x>y && x>z) = x
              | (y>x && y>z) = y
              | otherwise = z

--otra solucion 

maxTres2 :: Int -> Int -> Int -> Int
maxTres2 x y z = max (maximoDeDos x y) (maximoDeDos y z) 

maximoDeDos :: Int -> Int -> Int
maximoDeDos x y = max x y        

--4

concatenar1 :: [a] -> [a] -> [a]
concatenar1 [] ys = ys
concatenar1 (x:xs) [] = x:concatenar1 xs []
concatenar1 (x:xs) (y:ys) = x:concatenar1 xs (y:ys) 

--take
tomar :: [a] -> Int -> [a]
tomar [] _     = []
tomar _ 0      = []
tomar (x:xs) n = x:tomar xs (n-1)

--drop
tirar :: [Int] -> Int ->[Int]
tirar [] _     = []
tirar xs 0     = xs 
tirar (x:xs) n = tirar xs (n-1)


-- : <I concatenacion de listas atras

concAtras :: [a] -> a -> [a]
concAtras xs x = xs ++ [x]   

-- 5) valor absoluto

abso :: Int -> Int
abso n | n >= 0 = n
       | n < 0  = (-n)
  
-- 6) edad con ifs 

edad :: (Int,Int,Int) -> (Int,Int,Int) -> Int
edad (x,y,z) (n,m,k) = if k>z then (if m<y then (k-z)-1 else (if n<x then (k-z)-1 else k-z) ) else (if m<y then (z-k) else (if n<x then (z-k)-1 else (z-k) ))

-- 7) or excluyente

xor :: Bool -> Bool -> Bool
xor False False = False
xor False True = True
xor True False = True
xor True True = False 

xor2 :: Bool -> Bool -> Bool
xor2 False True = True
xor2 True False = True
xor2 _ _ = False

xor3 :: Bool -> Bool -> Bool
xor3 x y | x == y = False
         | otherwise = True

--la diferencia seria la eficiencia, me ahorro casos

-- 8)

primo :: Int -> Bool
primo 0 = False
primo n = length ([x | x <- [1..n] , mod n x == 0]) == 2

-- 9)

primosMenores :: Int -> [Int]
primosMenores 0 = []
primosMenores x | (primo x == True) = x:primosMenores (x-1)
                | otherwise = primosMenores (x-1)

-- 10)

reversa :: (Eq a) => [a] -> [a]
reversa [] = []
reversa (x:xs) = reversa xs ++ [x]

-- 11)

iguales :: [Int] -> [Int] -> Bool
iguales [] []         = True
iguales xs []         = False
iguales [] ys         = False
iguales (x:xs) (y:ys) | x == y = iguales xs ys 
                      | otherwise = False 

-- 12)

palindromo :: (Eq a) => [a] -> Bool
palindromo [] = True
palindromo xs = xs == reversa xs

-- 13) 

tresNum :: Double -> Double -> Double -> Int
tresNum a b c | x > 0 = 2
              | x < 0 = 0
              | otherwise = 1
        where x = b^2 - 4*a*c

-- x seria discriminante , si discriminante es positivo pasa tal cosa, si es negativo tal otra y si es 0 otra. propiedad

