-- Listas infinitas

-- ej 1)

listUnos :: [Int]
listUnos = [1,1..]

-- ej 2)

listNumDado :: Int -> [Int]
listNumDado n = [n..]

-- ej 3)

primerosNats :: Int -> [Int]
primerosNats n = [1..n]

-- ej 4)

prim5 :: [Int] -> [Int]
prim5 xs = take 5 xs

-- Funciones de alto orden 

-- ej 5) 

cuad xs = map (^2) xs  

-- cuad [5,2,1]
-- [def de map] 
-- map (^2) [5,2,1]
-- [def de map]
-- (^2) 5 : map (^2) [2,1]
-- [def de ^2 y de map]
-- 25 : (^2) 2 : map (^2) [1]
-- [def de ^2 y de map]
-- 25 : 4 : (^2) 1 : map (^2) []
-- [def de ^2 y de map caso base]
-- 25 : 4 : 1 : []
-- [def :, cuentas]
-- [25,4,1]

-- (^2) como es que da a -> b
-- b que da el resultado tiene que dar resultados de [b], es decir cuad le tengo q pasar numeros xq la funcion me devuelve un numero 


{-
map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x:xs) = f x:map f xs

filter :: (a -> Bool) -> [a] -> [a]
filter f []     = []
filter f (x:xs) | f x == True = x:filter f xs
                | otherwise = filter f xs

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f z []     = z
foldr f z (x:xs) = f x (foldr f z xs) 

foldl :: (a -> b -> a) -> a -> [b] -> a
foldl f z []     = z
foldl f z (x:xs) = foldl f (f z x) xs 

-}

-- ej 6) 


divs n = filter (esDivisor n) [1..n]

esDivisor n m = mod n m == 0 

{-
filter :: (a -> Bool) -> [a] -> [a]
filter f []     = []
filter f (x:xs) | f x == True = x:filter f xs
                | otherwise = filter f xs
-}
{-
divs n = filter (esDivisor n) [1..n]

divs 4 
= [def de filter]
filter (esDivisor 4) [1..4]
= 

-}

-- ej 7)

listNats xs = filter (esPrimo) xs

esPrimo n = length ([x | x <- [1..n], mod n x == 0]) == 2

-- ej 8)

sumCuad xs = foldr (+) 0 (cuad xs)

-- ej 9)

suce xs = map (+1) xs

-- ej 10)

sumaFold xs = foldl (+) 0 xs

-- ej 11)

factFold n = foldr (*) 1 [1..n]

-- ej 12)

and2 xs = foldr (&&) True xs
 

{-
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f z []     = z
foldr f z (x:xs) = f x (foldr f z xs) 

foldl :: (a -> b -> a) -> a -> [b] -> a
foldl f z []     = z
foldl f z (x:xs) = foldl f (f z x) xs 
-}
{-
and2 (1 < 2,2 < 3, 1 /= 0)
    = [def de foldr]
      foldr (&&) True [1 < 2,2 < 3,1 /= 0]
    = [def de foldr]
      (1<2) (&&) (foldr (&&) True [2 < 3,1 /= 0])
    = [1<2 es true y def de foldr]
      True && ((2 < 3) (Foldr (&&) True [1 /= 0])
    = [2<3 es true y def de foldr]
      True && (True && (1 /= 0) (Foldr (&&) True [])
    = [1 /= 0 es true, y def de foldr caso base llegue]
      True && (True && (True && True))
    = [def de && asociando como se debe]
      True && (True && True)
    = [Sigo]
      True && True
    = [Sigo]
      True    
-}

{-
and :: Bool -> Bool -> Bool
and True True = True
and _ _ = False
-}

-- 
-- ej 13)

tamFoldr :: [a] -> Int
tamFoldr xs = foldr (contarFoldr) 0 xs

contarFoldr :: a -> Int -> Int -- a -> b -> b
contarFoldr _ acc = acc + 1

-- el foldl no seria bueno aplicarlo aca xq la funcion va de a -> b -> a
-- es decir el segundo parametro es distinto al resultado(tercero y aca son iguales son Ints)
-- por eso hay que hacer otro contar que la f del foldl ande es decir el primer parametro sea el resultado de la funcion.

tamFoldl :: [a] -> Int 
tamFoldl xs = foldl (contarFoldl) 0 xs

contarFoldl :: Int -> a -> Int -- a -> b -> a
contarFoldl acc _ = acc + 1

