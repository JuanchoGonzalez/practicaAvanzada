{- 
ejercicio 2 
head (tail "hola mundo")
-}

{- 
ejercicio 3
head (reverse "hola mundo")
-}

{- 
ejercicio 5 
-- El ultimo valor del numero,es decir la cabeza de la reversa debe ser mod 2 == 0 para q sea par
-}
par xs = mod (head (reverse xs)) 2 == 0

-- ejercicio 6

mult3 xs = mod (sum xs) 3 == 0

-- ejercicio 7

mult6 xs = mult3 xs && par xs -- o bueno en todo caso par o multiplos de 2

-- ejercicio 8

intToList :: Int -> [Int]
intToList 0 = []
intToList x = intToList (div x 10) ++ [mod x 10] 

-- segunda opcion 

intToList2 :: Int -> [Int] 
intToList2 0 = []
intToList2 n | n < 10 = [n]
             | otherwise = intToList2 (div n 10) ++ [mod n 10]

-- ejercicio 9 
 
palindromo :: [Int] -> Bool
palindromo xs = reverse xs == xs

{-
ejercicio 10
(head.(drop 3)) "0123456"
arrojara resultado igual a 3 , ya que tira los primeros 3 es decir 0,1 y 2 y el head de "3456" es 3

el tipo resultante es un caracter '3'
podria ser el . creo

-}




