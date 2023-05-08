data Naturales = Cero | Succ Naturales

instance Eq Naturales where
    Cero == Cero = True
    (Succ n) == (Succ m) = n == m
    Cero == (Succ n) = False
    (Succ n) == Cero = False
    
instance Ord Naturales where
    Cero <= (Succ n) = True
    (Succ n) <= (Succ m) = n <= m
    (Succ n) <= Cero = False
    _ <= _ = True 
    
instance Show Naturales where
    show Cero     = "Cero"    
    show (Succ n) = mostrarNats (Succ n)

mostrarNats :: Naturales -> String
mostrarNats Cero     = "Cero"
mostrarNats (Succ n) = "Succ(" ++ mostrarNats n ++  ")"     

natAint :: Naturales -> Int
natAint Cero     = 0
natAint (Succ n) = 1 + natAint n 

intAnat :: Int -> Naturales
intAnat 0 = Cero
intAnat n = Succ (intAnat (n-1))

sumaNat :: Naturales -> Naturales -> Naturales
sumaNat Cero Cero         = Cero
sumaNat Cero (Succ m)     = (Succ m)
sumaNat (Succ n) Cero     = (Succ n)
sumaNat (Succ n) (Succ m) = (Succ(Succ (sumaNat n m))) 

multNat :: Naturales -> Naturales -> Int
multNat Cero _            = 0
multNat (Succ n) Cero     = 0 
multNat (Succ n) (Succ m) = natAint (Succ n) * natAint (Succ m)

-----------------------------------------------------------------------------------------------------------------

data Arbol a = Null | Nodo a (Arbol a) (Arbol a) 

instance (Eq a) => Eq (Arbol a) where
    Null == Null = True
    Null == (Nodo p l r) = False
    (Nodo f i d) == Null = False
    (Nodo f i d) == (Nodo p l r) = (f == p) && (i == l) && (d == r)

instance (Show a) => Show (Arbol a) where
    show Null = "--"
    show (Nodo r i d) = mostrarArb (Nodo r i d)

mostrarArb :: (Show a) => (Arbol a) -> String
mostrarArb Null         = " -- "
mostrarArb (Nodo r i d) = "Nodo " ++ (show r) ++ " (" ++ mostrarArb i ++ mostrarArb d ++ ")"    

cantNodos :: Arbol a -> Int
cantNodos Null         = 0
cantNodos (Nodo r i d) = 1 + cantNodos i + cantNodos d  

arbolDadoVuelta :: Arbol a -> Arbol a
arbolDadoVuelta Null         = Null 
arbolDadoVuelta (Nodo c z y) = Nodo c (arbolDadoVuelta y) (arbolDadoVuelta z)

alturaArb :: (Arbol a) -> Int
alturaArb Null = 0
alturaArb (Nodo r i d) = 1 + max (alturaArb i) (alturaArb d)

arbToLista :: (Arbol a) -> [a]
arbToLista Null         = []
arbToLista (Nodo r i d) = r:arbToLista (i) ++ arbToLista (d)  

-----ARBOL NO VACIO---------------------------------------------------------------------------------------------------------------

data NonEmptyTree a = NodC a | NodoN a (NonEmptyTree a) (NonEmptyTree a)

instance (Eq a) => Eq (NonEmptyTree a) where
    NodC ro == NodC ra = ro == ra 
    (NodoN ro l r) == (NodoN ra hi hd) = ro == ra && l == hi && r == hd
    NodC ro == (NodoN ra hi hd) = False
    (NodoN ro l r) == NodC ra = False

instance (Show a) => Show (NonEmptyTree a) where
    show (NodC ro) = "(NodoC " ++ show ro ++ ")"
    show (NodoN ro l r) = mostrarArbN (NodoN ro l r)

mostrarArbN :: (Show a) => (NonEmptyTree a) -> String
mostrarArbN (NodC ro) = "(NodoC " ++ (show ro) ++ ")"
mostrarArbN (NodoN p l r) = " Nodo " ++ (show p) ++ " (" ++ mostrarArbN l ++ mostrarArbN r ++ ") "     

cantNodosN :: (NonEmptyTree a) -> Int
cantNodosN (NodC r) = 1
cantNodosN (NodoN r hi hd) = 1 + cantNodosN hi + cantNodosN hd

tmap :: (NonEmptyTree a) -> (a -> a) -> (NonEmptyTree a) 
tmap (NodC r) f = NodC (f r)
tmap (NodoN r hi hd) f = NodoN (f r) (tmap hi f) (tmap hd f) 

flattenN :: (NonEmptyTree a) -> [a]
flattenN (NodC r) = [r]
flattenN (NodoN r hi hd) = [r] ++ (flattenN hi) ++ (flattenN hd)

--RACIONALES----------------------------------------------------------------------------------------------------------------------

data Racionales = Integer :/ Integer 

instance Num Racionales where
    (a :/ b) + (c :/ d) = ((a*d) + (c*b)) :/ (b*d)
    (a :/ b) - (c :/ d) = ((a*d) - (c*b)) :/ (b*d)
    (a :/ b) * (c :/ d) = (a*c) :/ (d*b)
    fromInteger a = (a :/ 1)
    abs (a :/ b) = (abs a) :/ (abs b)
    signum (a :/ b) = ((signum a) * (signum b)) :/ 1

instance Eq Racionales where
    (a :/ b) == (c :/ d) = (a*d) == (b*c)

instance Show Racionales where
    show (a :/ b) = show a ++ "/" ++ show b
{- Warning
instance Fractional Racionales where
    (a :/ b) / (c :/ d) = (a*d) :/ (b*c)   
-}
--LISTA COMUN----------------------------------------------------------------------------------------------------------------------

data Lista a = Vacio | a :-: (Lista a) 

instance (Eq a) => Eq (Lista a) where
    Vacio == Vacio           = True
    Vacio == (x :-: xs)      = False
    (x :-: xs) == Vacio      = False 
    (x :-: xs) == (y :-: ys) = (x == y) && (xs == ys)


instance (Show a) => Show (Lista a) where
    show Vacio       = "[]"
    show (x :-: xs) = mostrarLista (x :-: xs) 

cabeza :: (Lista a) -> a
cabeza Vacio = error "no existe"
cabeza (x :-: xs) = x

cola :: (Lista a) -> (Lista a)
cola Vacio = Vacio
cola (x :-: xs) = xs

mostrarLista :: (Show a) => (Lista a) -> String  
mostrarLista Vacio = "[]"
mostrarLista (x :-: xs) =  (show x) ++ ":" ++ mostrarLista xs

longitud :: (Lista a) -> Int
longitud Vacio  = 0
longitud (x :-: xs) = 1 + longitud xs

concatenacion :: (Lista a) -> (Lista a) -> (Lista a)
concatenacion Vacio ys           = ys
concatenacion (x :-: xs) Vacio      = (x :-: xs)
concatenacion (x :-: xs) (y :-: ys) = x :-: (concatenacion xs (y :-: ys)) 

reversaV :: (Lista a) -> (Lista a)
reversaV Vacio = Vacio
reversaV (x :-: xs) = reversaV xs `concatenacion` (x :-: (Vacio))

--LISTA NO VACIA-----------------------------------------------------------------------------------------------------------------

data ListaNoV a = Cabeza a | a :---: (ListaNoV a) deriving Show

cabezaNoVacia :: (Num a) => (ListaNoV a) -> a
cabezaNoVacia (Cabeza x) = x
cabezaNoVacia (x :---: xs) = cabezaNoVacia xs

longitudNoV :: (ListaNoV a) -> Int
longitudNoV (Cabeza x) = 1
longitudNoV (x :---: xs) = 1 + longitudNoV xs

concaNoV :: (ListaNoV a) -> (ListaNoV a) -> (ListaNoV a)
concaNoV (Cabeza x) ys = x :---: ys
concaNoV (x :---: xs) ys = x :---: (concaNoV xs ys)

reversa :: (ListaNoV a) -> (ListaNoV a)
reversa (Cabeza x) = Cabeza x
reversa (x :---: xs) = reversa xs `concaNoV` Cabeza x


--LISTA CON CONCATENACION A LA COLA----------------------------------------------------------------------------------------------
data ConcCola a = V | (ConcCola a) :--: a deriving Show

-- concatenacion de dos listas del tipo 
concCola :: (ConcCola a) -> (ConcCola a) -> (ConcCola a)
concCola V ys = ys
concCola xs V = xs
concCola (xs :--: x) (ys :--: y) = ((xs :--: x) `concCola` ys ) :--: y

longC :: (ConcCola a) -> Int
longC V = 0
longC (xs :--: x) = 1 + longC xs 

headConcCola :: (ConcCola a) -> a
headConcCola (xs :--: x) = x

lastConcCola :: (ConcCola a) -> a
lastConcCola (xs :--: x) = headConcCola (reversaConcCola (xs :--: x))  

reversaConcCola :: (ConcCola a) -> (ConcCola a) 
reversaConcCola V = V
reversaConcCola (xs :--: x) = reversaConcCola (xs :--: x)  `concCola` V


data DobleEntrada a = Vacia | a :> (DobleEntrada a) | (DobleEntrada a) :< a  deriving (Show)

instance (Ord a) => Ord (DobleEntrada a) where
    Vacia <= _ = True
    _ <= Vacia = True
    _ >= Vacia = False
    Vacia >= _ = False
    (x :> xs) >= (y :> ys) = longDE (x :> xs) >= longDE (y :> ys) 
    (x :> xs) >= (ys :< y) = longDE (x :> xs) >= longDE (ys :< y)
    (xs :< x) >= (y :> ys) = longDE (xs :< x) >= longDE (y :> ys)
    (xs :< x) >= (ys :< y) = longDE (xs :< x) >= longDE (ys :< y)

instance (Eq a) => Eq (DobleEntrada a) where
    Vacia == Vacia = True
    Vacia == _ = False
    (x :> xs) == (y :> ys) = x == y && xs == ys
    (xs :< x) == (ys :< y) = xs == ys && x == y
    (x :> xs) == (ys :< y) = x == y && xs == ys
    (xs :< x) == (y :> ys) = xs == ys && x == y  


concDobleE :: (Num a) => (DobleEntrada a) -> (DobleEntrada a) -> (DobleEntrada a)
concDobleE Vacia ys = ys
concDobleE xs Vacia = xs
concDobleE (x :> xs) (y :> ys) = x :> concDobleE xs (y :> ys) -- la comun ++
concDobleE (x :> xs) (ys :< y) = (x :> (concDobleE xs (y :> ys))) -- intermedios 
--concDobleE (xs :< x) (y :> ys) = (xs :< x) `concDobleE` (y :> ys) -- intermedios
concDobleE (xs :< x) (ys :< y) = ((xs :< x) `concDobleE` ys) :< y -- conc a la cola 

longDE :: (DobleEntrada a) -> Int
longDe Vacia = 0
longDE (x :> xs) = 1 + longDE xs
longDE (xs :< x) = 1 + longDE xs

{-
data Lista a = Vacio | a :-: (Lista a) 
concatenacion (3 :-: (2 :-: Vacio)) (4 :-: (5 :-: Vacio))
3,2,4,5,[]
data ConcCola a = V | (ConcCola a) :-: a deriving Show
concCola ((V :-: 3) :-: 2) ((V :-: 4) :-: 5)
[],3,2,4,5
-}





