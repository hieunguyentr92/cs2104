--HENG LOW WEE
--U096901R
--Problem 5 Problem 1

insert a pos l = 
    fst ( foldr
        (\x (b,c) -> (if c==pos then x:(a:b) else x:b,c+1))
        ((drop pos []),0) l)