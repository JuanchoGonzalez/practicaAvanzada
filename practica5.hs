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

-- (^2) como es que da a -> b ?? 
-- b que da el resultado tiene que dar resultados de [b]
-- es decir cuad le tengo q pasar numeros xq la funcion me devuelve un numero 

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

          filtrar :: (a -> Bool) -> [a] -> [a]
filtrar f []     = []
filtrar f (x:xs) = if (f x) then x:filtrar f xs else filtrar f xs      
-}
{-
divs n = filter (esDivisor n) [1..n]

divs 4 
= 
filter (esDivisor 4) 1:[2..4]
= [def de filter]
1:filter (esDivisor 4) 2:[3..4]
= [def de filter]
1:2:filter (esDivisor 4) 3:[4]
= [def de filter]
1:2:filter (esDivisor 4) [4]
= [def de filter]
1:2:4:filter (esDivisor 4) []
= [def de filter caso base]
1:2:4:[]
= [reescribiendo]
[1,2,4]
-}

-- ej 7)

listNats xs = filter (esPrimo) xs

esPrimo n = length ([x | x <- [1..n], mod n x == 0]) == 2

-- ej 8)

sumCuad xs = foldr (+) 0 (cuad xs) -- cuad es una funcion que dada una lista de numeros te devuelve los cuadrados de los numeros

-- otra opcion

sumaCuad xs = foldl (+) 0 (map (^2) xs)

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

-- puede funcionar para listas infinitas el foldr.

foldl :: (a -> b -> a) -> a -> [b] -> a
foldl f z []     = z
foldl f z (x:xs) = foldl f (f z x) xs 


foldr && True [2>3,3 == 3,False]
&& (2>3) (foldr && True [3 == 3 , False] )
-- [aritmetica]
&& (False) (foldr && True [3 == 3 , False] )
-- por def de foldr
False

foldl && True [2>3,3 == 3,False]
foldl && (&& True (2>3) , [3 == 3 , False] )
foldl && (&& True [False && True]  ) , [False] )
foldl && (&& True [False && True && False]  ) , [] )
-- caso base
False 

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


-- Listas por comprension

-- ej 14) 

sucesores :: [Int] -> [Int]
sucesores xs = [n+1 | n <- xs]

sucesores2 :: [Int] -> [Int]
sucesores2 xs = [x+1 | x <- xs]

-- ej 15) 

cuadrados :: [Int] -> [Int]
cuadrados xs = [n^2 | n <- xs]

-- ej 16)

paresMayDiez :: [Int] -> [Int]
paresMayDiez xs = [n | n <- xs , mod n 2 == 0 , n > 10]

-- ej 17)

divisores :: Int -> [Int]
divisores n = [x | x <- [1..n] ,mod n x == 0]

-- ej 18)

-- sin listas por comprension 

todosOcurrenEn :: (Eq a) => [a] -> [a] -> Bool
todosOcurrenEn [] ys         = True
todosOcurrenEn (x:xs) []     = False
todosOcurrenEn (x:xs) (y:ys) = length (x:xs) == contatoriaEsta (x:xs) (y:ys)  

contatoriaEsta :: (Eq a) => [a] -> [a] -> Int
contatoriaEsta [] ys         = 0
contatoriaEsta (x:xs) []     = 0
contatoriaEsta (x:xs) (y:ys) | elem x (y:ys) = 1 + contatoriaEsta xs (y:ys)
                             | otherwise = contatoriaEsta xs (y:ys)

-- con listas por comprension

todosOcurrenEn2 :: (Eq a) => [a] -> [a] -> Bool
todosOcurrenEn2 xs ys = length xs == length [x | x <- xs , elem x ys]   

-- diferencia por recursion y por listas por comprension que diferencia de eficiencia, de codigo de lineas.

-- ej 19)

primEntre2yN :: Int -> [Int]
primEntre2yN n = [x | x <- [2..n] , esPrimo x]

-- ej 20)

prodCartesiano :: [Int] -> [Int] -> [(Int,Int)]
prodCartesiano xs ys = [(x,y) | x <- xs , y <- ys]

-- ej 21)

ocurrencia :: (Eq a) => [a] -> a -> Int
ocurrencia xs n = length [x | x <- xs , n == x]

-- ej 22)

split2prac :: [a] -> [([a],[a])]
split2prac xs = [(take n xs,drop n xs) | n <- [0..length xs] ]

-- ej 23) 

sumaSegIni :: [Int] -> Int
sumaSegIni xs = foldl (+) 0 [sum (take n xs) | n <- [0..length xs] ]

-- [1,2,3,4]

{-

foldl (+) 0 [sum [], sum [1], sum [1,2], sum [1,2,3], sum [1,2,3,4]]
-- [def sum]
foldl (+) 0 [0, 1, 3, 6, 10]
-- [def foldl]
foldl (+) (0 + 0) [1,3,6,10]
-- [def foldl]
foldl (+) (0 + 0 + 1) [3,6,10]
-- [def foldl]
foldl (+) ((0 + 0) + 1) + 3) [6,10]
-- [def foldl]
foldl (+) (((0 + 0) + 1) + 3) + 6) [10]
-- [def foldl]
foldl (+) ((((0 + 0) + 1) + 3) + 6) + 10) []
-- [def foldl]
-- ((((0 + 0) + 1) + 3) + 6) + 10) 
-- [def +]
-- ((((0 + 1) + 3) + 6) + 10)
-- [def +]
-- (((1 + 3) + 6) + 10)
-- [def +]
-- ((4 + 6) + 10)
-- [def +]
-- (10 + 10)
-- 20 

-- la lista por comprension me va dando la suma de las listas
-- que forman el conjunto de listas de subsegmentos iniciales
-- luego hago un foldl con la operacion suma de la lista q me quedo(sumas)

-}


-- suma sugsegmentos iniciales

segFinales :: [Int] -> [[Int]]
segFinales xs = [tirar xs n | n <- [0..length xs]]

tirar :: [Int] -> Int ->[Int]
tirar [] _     = []
tirar xs 0     = xs 
tirar (x:xs) n = tirar xs (n-1)


-- ej 24)

infPares :: [Int]
infPares = [2*n | n <- [0..] ]

-- adicionales

-- map mas general posible

igualesA1 :: Int -> Bool
igualesA1 x = x == 1

mapab :: [Int] -> [Bool] 
mapab xs = map (igualesA1) xs 

-- importa repeticiones pero no importa orden
-- multiConjunto "campeones" = [(c,1),(a,1),(m,1),(p,1),(o,1),(n,1),(e,2),(s,1)]
multiConjunto :: (Eq a) => [a] -> [(a,Int)]
multiConjunto xs = [(x,ocurrencia xs x) | x <- nub xs]

-- nub saca repeticiones en una lista fueran 2 3 o n repeticiones.
nub :: (Eq a) => [a] -> [a]
nub [] = []
nub (x:xs) | elem x xs = nub xs
           | otherwise = x:nub xs

-- ocurrencia :: [Int] -> Int -> Int
-- ocurrencia xs n = length [x | x <- xs , n == x]

-- matriz infinita, lista por comprension

diag :: Int -> [(Int,Int)]
diag n = [(i,n-i) | i <- [0..n]]

allpars = concatLdeL [diag n | n <- [0..]]

concatLdeL :: [[a]] -> [a]
concatLdeL []       = []
concatLdeL (xs:xss) = xs ++ concatLdeL xss




