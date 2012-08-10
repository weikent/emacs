#-*- coding: utf-8 -*-

# input 和 raw_input 的区别
# 输入纯数字的时候
#     input返回值是数字
#     raw_input 返回值是字符串

#     input 数字表达式会转换成数值
#     raw_input 不会

#     输入"5+45"
#     input会得到50
#     raw_input 会得到"5+45"


print "How old are you?",
age = raw_input()
print "How tall are you?",
height = raw_input()
print "How much do you weight?",
weight = raw_input()

print "So, you're %r old, %r tall and %r heavy." % (age, height, weight)



# type string
nID = ''

while 1:
    nID = raw_input("Input you id plz")
    if len(nID) != len("1232323232***"):
        print 'wrong length of id, input again'
    else:
        break

print 'your id is %s' % (nID)



#type int

nAge = int(raw_input("input you age:\n"))
if nAge > 0 and nAge < 120:
    print 'thanks'
else:
    print 'bad age'

print 'you age is %d \n' % nAge


#type float

fWeight = 0.0
fWeight = float(raw_input("input you weight\n"))
print 'your weight is %f' % fWeight


#type 16 进制

nHex = int(raw_input('input hex value(like 0x20):\n'),16)
print 'nHex = %x, nOct = %d\n' %(nHex, nHex)


#type 8 进制

nOct = int(raw_input('input oct value(like 030):\n'),8)
print 'nOct = %o, nDec = %d\n' % (nOct, nOct)
