--HENG LOW WEE
--U096901R
--Problem Set 5 Problem 2

-- count x l = foldr <code> 0 <code> 

count x l = foldr (\x y -> if x==y then x+1 else x) 0 l