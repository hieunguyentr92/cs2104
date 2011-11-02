# HENG LOW WEE
# U096901R
# Problem Set 7 Problem 2

def tail(g): # no haskell equivalent since no pattern matching
	def p():
		h = g()
		next(h)
		for x in h:
			yield x
        return p

def head(g): # no haskell equivalent since no pattern matching
    return next(g())
# haskell: map f l = (f (head l)):(map f (tail l))
def mapgen(f,g):
    def rets():
        yield f(head(g))
        for x in mapgen(f,tail(g))():
        	yield x
    return rets
# haskell: ints = 1:map (\x -> x+1) ints
def ints():
    yield 1
    h=mapgen(lambda x:x+1,ints)()
    for x in mapgen(lambda x:x+1,ints)():
	    yield x

# Do we need to find out which is the smaller list?
# Because the output list's size is bounded by that smaller list
# Function f must be a operation that takes 2 arguments
def zipwith(f,g1,g2):
    def rets():
        yield f(head(g1),head(g2))
        for x in zipwith(f, tail(g1), tail(g2))():
            yield x
    return rets