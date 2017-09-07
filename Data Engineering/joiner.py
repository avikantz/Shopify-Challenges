#!/usr/bin/python

# Runtime Python 2.7

import os
import sys
import json

def innerJoin(array1, key1, array2, key2):
	res = []
	array2map = {}

	# Create values to dict map from array2
	for e in array2:
		array2map[e[key2]] = e

	# Join if present in both arrays
	for d in array1:
		if d[key1] in array2map:
			e = array2map[d[key1]]
			f = d.copy()
			for k in e:
				if k != key2: # prevent duplicates of joining key
					f[k] = e[k]
			res.append(f)
	return res

# array1 -> array2
def sideOuterJoin(array1, key1, array2, key2):
	res = []
	array2map = {}

	# Create a set of keys of array2
	keys2 = set([])
	for k in array2[0]:
		keys2.add(k)
	keys2.remove(key2)

	# Same as above
	for e in array2:
		array2map[e[key2]] = e
	for d in array1:
		f = d.copy()
		if d[key1] in array2map:
			e = array2map[d[key1]]
			for k in e:
				if k != key2:
					f[k] = e[k]
			res.append(f)
		else:
			# if not found in array2, add the rows anyways (left)
			for k in keys2:
				f[k] = None
			res.append(f)
	return res

def fullOuterJoin(array1, key1, array2, key2):
	res = []
	array2map = {}

	# Create a set of keys for array1 as well
	keys1 = set([])
	for k in array1[0]:
		keys1.add(k)
	keys1.remove(key1)

	# Same as side outer join
	keys2 = set([])
	for k in array2[0]:
		keys2.add(k)
	keys2.remove(key2)
	for e in array2:
		array2map[e[key2]] = e
	for d in array1:
		f = d.copy()
		if d[key1] in array2map:
			e = array2map[d[key1]]
			array2.remove(e) # Filter out already added rows
			for k in e:
				if k != key2:
					f[k] = e[k]
			res.append(f)
		else:
			for k in keys2:
				f[k] = None
			res.append(f)

	# Add remaining elements from array2
	for e in array2:
		f = e.copy()
		f[key1] = f[key2] # consistency between keys
		del f[key2]
		for k in keys1:
			f[k] = None
		res.append(f)

	return res

file_name_1 = raw_input("Enter file 1 name: ")
file_name_2 = raw_input("Enter file 2 name: ")

try:
	f1 = open(file_name_1, 'r')
except:
	f1 = open('customers.json', 'r')
try:
	f2 = open(file_name_2, 'r')
except:
	f2 = open('orders.json', 'r')	

# f1 = open('customers.json', 'r')
# f2 = open('orders.json', 'r')

f1key = raw_input("Enter key for file 1: ")
f2key = raw_input("Enter key for file 2: ")

# f1key = 'cid'
# f2key = 'customer_id'

array1 = json.loads(f1.read())
array2 = json.loads(f2.read())

# print("array1: ")
# print(json.dumps(array1, sort_keys=True, indent=4))

# print("array2: ")
# print(json.dumps(array2, sort_keys=True, indent=4))

print("1. Inner Join\n2. Left Outer Join\n3. Right Outer Join\n4. Full Outer Join")
inp = raw_input("Enter choice: ")
try:
	ch = int(inp)
except:
	ch = 0

if ch < 1 or ch > 4:
	print("Invalid choice.")
	sys.exit()	

if (ch == 1):
	res = innerJoin(array1, f1key, array2, f2key)
	print(json.dumps(res, sort_keys=True, indent=4))
elif (ch == 2):
	res = sideOuterJoin(array1, f1key, array2, f2key)
	print(json.dumps(res, sort_keys=True, indent=4))
elif (ch == 3):
	res = sideOuterJoin(array2, f2key, array1, f1key)
	print(json.dumps(res, sort_keys=True, indent=4))
elif (ch == 4):
	res = fullOuterJoin(array1, f1key, array2, f2key)
	print(json.dumps(res, sort_keys=True, indent=4))

