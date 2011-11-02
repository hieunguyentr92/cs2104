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

def ints2(k):
    yield k
    g=ints2(k+1)
    while True:
        yield next(g)

# def zipwith(f,list1,list2):
#     yield f(list1.pop(0),list2.pop(0))
#     g=zipwith(f,list1,list2)
#     while True:
#         yield next(g)

def zipwith(f,i,j):
    yield f(next(i),next(j))
    g=zipwith(f,i,j)
    while True:
        yield next(g)

i=ints2(0)
j=ints2(1)
output = zipwith((lambda x,y:x+y),i,j)
print next(output)
print next(output)
print next(output)
print next(output)
print next(output)
print next(output)
print next(output)
print next(output)
print next(output)
print next(output)