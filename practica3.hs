-- ej 1)

merge :: (Ord a) => [a] -> [a] -> [a]
merge [] ys = ys
merge (x:xs) [] = x:xs
merge (x:xs) (y:ys) | (x <= y) = x:merge xs (y:ys) 
                    | otherwise = y:merge (x:xs) ys

-- ej 2)

-- selection sort, toma el minimo de la lista y lo elimina el minimo de la lista  

ordList :: (Ord a) => [a] -> [a]
ordList []       = []
ordList [x]      = [x]
ordList (x:y:xs) = minimum (x:y:xs):ordList (sacarMinimo (minimum (x:y:xs)) (x:y:xs))   

-- concatena el minimo de la lista con la recursion de la funcion auxiliar que saca el minimo de una lista
-- mas toda la lista completa(que ya fue sacado el minimo), cuando llega a que quede una lista unitaria(es el mayor valor), lo concatena al final como viene la recursion.

sacarMinimo :: (Eq a) => a -> [a] -> [a]
sacarMinimo _ []     = []
sacarMinimo n (x:xs) | (n == x) = xs         
                     | otherwise = x:sacarMinimo n xs
                     
-- esta funcion auxiliar implementada sola le tendrias q pasar como precondicion el minimo valor de la lista, es decir 
-- debes saber cual es la lista anticipadamente, aunque en la funcion original anda genial.

-- ej 3) 

dosAlaN :: Int -> Int
dosAlaN 0 = 1
dosAlaN n = 2 * dosAlaN (n-1)          

-- ej 4) 
-- con recursion a la derecha 

binario :: Int -> [Int]
binario 0 = []
binario 1 = [1]
binario n | mod n 2 == 0 = binario (div n 2) ++ [0]
          | otherwise = binario (div n 2) ++ [1]

-- otra solucion con recursion a la izquierda 

binario2 :: Int -> [Int]
binario2 0 = [0]
binario2 1 = [1]
binario2 n | mod n 2 == 0 = reverAux (0:binario2 (div n 2))
           | otherwise = reverAux (1:binario2 (div n 2))

reverAux :: [Int] -> [Int]
reverAux [] = []
reverAux xs = reverse xs

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

-- cuadrado perfecto , cuando n lo puedo escribir x*x , siendo x entre 0 y n  

{-
esCuadradoPerf :: (Num a) => a -> Bool
esCuadradoPerf n = ((sqrt n) == esEntero n) 
-}

-- ej 8) 

-- dada una lista de elementos, un elemento y un entero n, retorne true si z aparece n veces

repet :: (Eq a) => [a] -> a -> Int -> Bool
repet [] _ 0     = True  
repet [] _ _     = False 
repet (x:xs) z n | (x == z) = repet xs z (n-1)  
                 | otherwise = repet xs z n

-- ej 9)
-- . acceso directo
nelem :: [a] -> Int -> a
nelem [] _ = error "No tiene sentido"
nelem (x:xs) 0 = x
nelem (x:xs) n = nelem xs (n-1)    

-- ej 10)

posicionesC :: [Char] -> Char -> [Int]
posicionesC [] _ = []
posicionesC xs c = aux xs c 0

aux ::[Char] -> Char -> Int -> [Int]
aux [] _ _ = []
aux (x:xs) c n | x == c = n: aux xs c (n+1)
               | otherwise = aux xs c (n+1)

-- ej 11) 

compact :: (Eq a) => [a] -> [a] 
compact [] = []
compact [x] = [x]
compact (x:y:xs) | x == y = y:compact xs
                 | otherwise = x:compact (y:xs)  
