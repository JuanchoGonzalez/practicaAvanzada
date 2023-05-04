-- ej 1

-- definicion nat

data Nat = Cero | Suce Nat 

-- SHOW

instance Show Nat where 
    show Cero = "Cero"
    show (Suce n) = "Sucesor(" ++ show n ++ ")"

-- Otra instanciacion del Show en naturales q muestra tipo digito.
{-
instance Show Nat where
    show n = show (natToInt n)
-}

-- EQ

instance Eq Nat where
   n == m = (natToInt n) == (natToInt m)

-- otra instanciacion del Eq en naturales con todo los casos mas explicito
{-
instance Eq Nat where
    Cero == Cero = True
    Cero == Suce n = False
    Suce n == Zero = False
    Suce n == Suce m = n == m 
-}

-- ORD

instance Ord Nat where
    Cero <= _ = True
    (Suce n) <= Cero = False
    (Suce n) <= (Suce m) = n <= m 

-- ej 2 

natToInt :: Nat -> Int
natToInt Cero = 0
natToInt (Suce n) = 1 + natToInt n 

-- ej 3

intToNat :: Int -> Nat
intToNat 0 = Cero
intToNat n = Suce (intToNat (n-1))

-- ej 4

sumaNat :: Nat -> Nat -> Nat 
sumaNat Cero Cero         = Cero
sumaNat Cero (Suce m)     = (Suce m)
sumaNat (Suce n) Cero     = (Suce n)
sumaNat (Suce n) (Suce m) = Suce (Suce (sumaNat n m))

-- ej adicional 

multNatToInt :: Nat -> Nat -> Int
multNatToInt Cero _            = 0
multNatToInt (Suce n) Cero     = 0
multNatToInt (Suce n) (Suce m) = natToInt (Suce n) * natToInt (Suce m) 

multNatToNat :: Nat -> Nat -> Nat
multNatToNat Cero _            = Cero
multNatToNat (Suce n) Cero     = Cero
multNatToNat (Suce n) (Suce m) = intToNat ((natToInt n) * (natToInt m))




-- ARBOLES

-- ej 5

data Arbol a = Nil | Nodo (Arbol a) a (Arbol a) 


instance (Show a) => Show (Arbol a) where
    show Nil            = " -- "
    show (Nodo hi r hd) = " (Nodo" ++ show hi ++ show r ++ show hd ++ ") " 

{-
mostrarArbol :: (Arbol a) -> String
mostrarArbol Nil = "<>"
mostrarArbol (Nodo hi r hd) = "< Nodo " ++ (mostrarArbol (hi) ++ (show r) ++ "," ++ mostrarArbol (hd)) ++ " >" 
-}

instance (Eq a) => Eq (Arbol a) where
    Nil == Nil = True
    Nil == (Nodo hl p hr) = False
    (Nodo hi r hd) == Nil = False
    (Nodo hi r hd) == (Nodo hl p hr) = (hi == hl) && (r == p) && (hd == hr)

size :: (Arbol a) -> Int -- tamaño
size Nil = 0
size (Nodo hi r hd) = 1 + size hi + size hd -- 1 + va por la raiz

height :: (Arbol a) -> Int
height Nil = 0
height (Nodo hi r hd) = 1 + max (height hi) (height hd) -- 1 + (por la raiz)

arbolDadoVuelta :: (Arbol a) -> (Arbol a)
arbolDadoVuelta Nil = Nil
arbolDadoVuelta (Nodo hi r hd) = Nodo (arbolDadoVuelta hd) r (arbolDadoVuelta hi)

{-

     3
   2   4
  1 - - - 
 - -

tendria q dar 
     3 
    4 2          
  - -  - 1
        - - 
-}

-- sumar los nodos que los numeros sean pares

arbolSumaPares :: (Arbol Int) -> Int
arbolSumaPares Nil = 0
arbolSumaPares (Nodo hi r hd) | (mod r 2 == 0) = r + arbolSumaPares hi + arbolSumaPares hd
                              | otherwise = arbolSumaPares hi + arbolSumaPares hd


-- poner en una lista los numeros impares de los nodos 

arbolListImpares :: (Arbol Int) -> [Int]
arbolListImpares Nil            = []
arbolListImpares (Nodo hi r hd) | (mod r 2 /= 0) = [r] ++ arbolListImpares hi ++ arbolListImpares hd
                                | otherwise = arbolListImpares hi ++ arbolListImpares hd

tmap :: (Arbol a) -> (a -> a) -> (Arbol a) 
tmap Nil f = Nil
tmap (Nodo hi r hd) f = Nodo (tmap hi f) (f r) (tmap hd f) 

