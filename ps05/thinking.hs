fst () -- since the final output is list, the tuple for fst must be ([Int], S), where S is at least Int (could be [Int] too)

foldr (\x (b,c) -> <code>) ((drop pos <code>),0) l
-- this will return ([final output], something)

-- function of foldr
(\x (b,c) -> <code>) -- expects 2 arguments: one item, one tuple

-- 2nd argument of foldr
(drop pos <code>) -- <code> must be a list