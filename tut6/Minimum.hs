--HENG LOW WEE
--U096901R
--CS2104 Tut 6 Ex 1

getmin [] = error "Form is emptiness; Emptiness is form"
getmin [x] = x
getmin [x,y] = min x y
getmin (h:t) = 0 -- need to fix this part
