# HENG LOW WEE
# U096901R
# Tut 5 Ex 1

mylist = [123, 234, 345, 456]

def sum(list1):
	temp = 0
	for num in list1:
		temp += num
	print 'Total is %d' % (temp)
	
sum(mylist)