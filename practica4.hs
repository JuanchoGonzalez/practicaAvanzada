-- orden aplicativo

-- orden normal 

-- ej 1)

-- 2*cuad(head.[2,4,5,6,7,8])

-- cuad :: Int -> Int
-- cuad x = x*x

-- orden aplicativo

-- 2*cuad(head.[2,4,5,6,7,8])
-- [def head]
-- 2*cuad(2)
-- [def cuad]
-- 2*(2*2)
-- [aritmetica]
-- 2*4
-- [aritmetica]
-- 8

-- 4 reducciones se cuentan las def q usamos 

-- orden normal

-- 2 * cuad(head.[2,4,5,6,7,8])
-- [def cuad]
-- 2* head.[2,4,5,6,7,8] * head.[2,4,5,6,7,8]
-- [def head del segundo, xq el primero no se puede aun]
-- 2 * 2 * head.[2,4,5,6,7,8]
-- [aritmetica]
-- 4 * head.[2,4,5,6,7,8]
-- [def head]
-- 4 * 2
-- [aritmetica]
-- 8 


-- ej 2)

-- linf = 1:linf

-- head.linf

-- orden aplicativo 

-- head.linf
-- [def linf]
-- head.(1:linf)
-- [def linf xq va a querer reducir lo de mas adentro,no quiere decir que head no se pueda hacer solo q primero quiere reducir lo de mas adentro]
-- head.(1:(1:linf))
-- [def linf]
-- head.(1:(1:(1:linf)))
-- [y se va ...]

-- orden normal

-- head.linf
-- [def linf]
-- head.(1:linf) 
-- [def head, va a probar hacerlo y se puede hacer]
-- 1


-- ej 3)

-- f x 0 = x
-- f x (n+1) = cuadrado (f x n)

-- f.2.3

-- orden aplicativo

-- f.2.3
-- [def f]
-- cuadrado(f 2 2)
-- [def f]
-- cuadrado.cuadrado(f.2.1)
-- [def f]
-- cuadrado.cuadrado.cuadrado f.2.0
-- [def f,cb]
-- cuadrado.cuadrado.cuadrado 2
-- [def cuadrado]
-- cuadrado.cuadrado.2*2
-- [aritmetica]
-- cuadrado.cuadrado.4
-- [def cuadrado]
-- cuadrado.4*4
-- [aritmetica]
-- cuadrado.16
-- [def cuadrado]
-- 16*16
-- [aritmetica]
-- 256 

-- orden normal

-- f.2.3
-- [def f]
-- cuadrado(f 2 2)
-- [def cuadrado]
-- f 2 2 * f 2 2
-- [def cuadrado de mas afuera]
-- cuadrado(f.2.1) * f 2 2
-- [def cuad]
-- f.2.1 * f.2.1 * f 2 2
-- [def f.2.1]
-- cuadrado(f.2.0) * f.2.1 * f 2 2
-- [def cuad]
-- f.2.0 * f.2.0 * f.2.1 * f 2 2
-- [def f]
-- 2 * f.2.0 * f.2.1 * f.2.2 
-- [def f]
-- 2 * 2 * f.2.1 * f.2.2 
-- [aritmetica]
-- 4 * f.2.1 * f.2.2 
-- [def f]
-- 4 * cuadrado(f.2.0) * f 2 2
-- [def cuadrado]
-- 4 * f.2.0 * f.2.0 * f 2 2
-- [def f]
-- 4 * 2 * f.2.0 * f.2.2 
-- [aritmetica]
-- 8 * f.2.0 * f.2.2 
-- [def f]
-- 8 * 2 * f.2.2 
-- [aritmetica]
-- 16 * f.2.2
-- [def f]
-- 16 * cuadrado(f.2.1) 
-- [def cuadrado]
-- 16 * f.2.1 * f.2.1 
-- [def f]
-- 16 * cuadrado(f.2.0) * f.2.1 
-- [def cuadrado]
-- 16 * f.2.0 * f.2.0 * f.2.1
-- [def f]
-- 16 * 2 * f.2.0 * f.2.1 
-- [aritmetica]
-- 32 * f.2.0 * f.2.1 
-- [def f]
-- 32 * 2 * f.2.1 
-- [aritmetica]
-- 64 * f.2.1 
-- [def f]
-- 64 * cuadrado(f.2.0) 
-- [def cuad]
-- 64 * f.2.0 * f.2.0
-- [def f]
-- 64 * 2 * f.2.0
-- [aritmetica]
-- 128 * f.2.0
-- [def f]
-- 128 * 2
-- [aritmetica]
-- 256


-- lazy 

-- f 2 3
-- [def f]                             -- 1
-- cuadrado f.2.2
-- [def cuad]                          -- 2
-- x*x
--    [ [x = f.2.2] ] 
-- [def de f.2.2]                      -- 3
-- x*x
-- [ [x = cuad(f.2.1)] ]
 -- [def cuad]                         -- 4
  -- y*y 
  -- [ [x = y*y] , [y = f.2.1] ] 
  -- [def f.2.1]                       -- 5
  -- y*y
  -- [y = cuad f.2.0]
  -- [def cuad]                        -- 6
    -- z*z 
    -- [ [y = z*z] , z = f.2.0 == 2 ]  -- 7              -- 7
    -- [aritmetica]                    -- 8
    -- 2*2  
    -- [aritmetica]                    -- 9
    -- 4
  -- [y=4] [reemplazo]                 -- 10
  -- 4*4 
  -- [aritmetica]                      -- 11
 -- [x=16] [reemplazo]                 -- 12
-- 16*16
-- [aritmetica]                        -- 13
-- 256


-- ej 4)

-- orden aplicativo 

-- square.inf
-- [def inf]
-- square.(inf+1) 
-- [def inf]
-- square.(inf(inf+1))
-- [def inf]a 
-- square.(inf(inf(inf+1)))
-- y se va... 

-- orden normal

-- square.inf
-- [def square]
-- inf * inf 
-- [def inf]
-- inf+1 * inf
-- [def inf] 
-- (inf+1)+1 * inf
-- [def inf]
-- ((inf+1)+1)+1 * inf
-- y se va..


-- esta resolucion no tiene forma normal . ya que el orden normal no llega nunca.

-- ej 6)

-- $! o $ es lo mismo.
-- puede servir para casos particulares, "aplicativa" 


-- ejercicio adicional

-- cond :: Bool -> a -> a
-- cond p x y | p == True = x
--            | otherwise = y

-- fac :: Num -> Num 
-- fac n = cond (n==0) 1 (n * fac(n-1) )

-- fac :: Int -> Int
-- fac 0     = 1
-- fac (n+1) = (n+1) * fac n 

-- fac 2
-- orden aplicativo
-- 
