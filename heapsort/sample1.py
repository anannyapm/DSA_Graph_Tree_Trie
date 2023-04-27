#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'bigSorting' function below.
#
# The function is expected to return a STRING_ARRAY.
# The function accepts STRING_ARRAY unsorted as parameter.
#
def heapify(array,index,size):
    left=index*2+1
    right=index*2+2
 
    
    maxIdx=index
    if(left<size and float(array[left])>float(array[maxIdx])):
        maxIdx=left
    if(right<size and float(array[right])>float(array[maxIdx])):
        maxIdx=right
    if(maxIdx!=index):
        temp=array[maxIdx]
        array[maxIdx]=array[index]
        array[index]=temp
        heapify(array,maxIdx,size)
    return array
def heapsort(array):
    n=len(array)
    for i in range(n//2,-1,-1):
        array=heapify(array,i,n)
    for i in range(n-1,0,-1):
        swap(i,0,array)
        array=heapify(array,0,i)
    return array
        
    
    
def bigSorting(unsorted):
    # Write your code here
    result=heapsort(unsorted)
    return result

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    n = int(input().strip())

    unsorted = []

    for _ in range(n):
        unsorted_item = input()
        unsorted.append(unsorted_item)

    result = bigSorting(unsorted)

    fptr.write('\n'.join(result))
    fptr.write('\n')

    fptr.close()
