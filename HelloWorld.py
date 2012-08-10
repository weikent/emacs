print "hello"
print "hello2"
import sys
print sys.path


# print range(1,100)
k = 1
for m in range(1,6):
    k = k * m

print k

def a(n):
    k = 1
    for m in range(1,n+1):
        k = k * m
    # print k
    # if k%100 == 0:
    #     k = k/100
    # print k
    print k
a(24)


def b(n):
    k = 1
    for m in range(1,n+1):
        if (m%10 == 0):
            k += 1
    print k
b(100)


def c(n):
    k=0
    for m in range(1,n+1):
        if(m%25==0):
            k+=1
    print k


        
c(100)

