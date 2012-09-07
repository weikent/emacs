# -*- coding: utf-8 -*-

import types
from Theurgy import *
from Player import *
from Menu import *


player = Player("wei",10,10, 10,10,10,10,0,10,1)

a = Fire1(player)


list = [1, 2, [4, 5, 6, 7]]

tempList = []
print len(tempList)
if len(tempList) == 0:
    print "a"

print "attack"
print "defend"
print "book"

action = raw_input("please choose a action")

if action == "attack":
    print list[0]
    tempList.append(0)

elif action == "defend":
    print list[1]
    tempList.append(1)

elif action == "book":
    print list[2]
    tempList.append(2)

exec("list[tempList[0]]")
tempList.append(2)
print list[tempList[0]]
strlist = "list["
for i in tempList:
    print i
    strlist +=str(i)+"]["


print strlist[0:-1]
print "strlist[0:-1]"
print list[2][2]
print "a"
print "list[tempList[0]]"

exec("print "+strlist[:-1])


a = 123
s1 = locals()['a']
s2 = vars()['a']
print s1, s2

print len(list)


listNum = [1, 2, [3, 4]]
listStr = ["attack", "defend", "book"]

dictNum = [1, 2, [3, 4]]
dictStr = {"Attack" : "0",
           "Defend" : "0",
           "book" : {"Cancel": "",
                     "earth" : {"Cancel" : "",
                               "Earth1" : "0",
                               "Earth2" : "0",
                               "Earth3" : "0"
                               },
                     "fire" : {"Cancel" : "",
                               "Fire1" : "0",
                               "Fire2" : "0",
                               "Fire3" : "0"
                               }
                     }
           }

print Menu(dictStr).show()

tempList = []
flag = 1

while flag :
    i = 1
    tem = ""

    if len(tempList) == 0:
        tem = dictStr.keys()
    else:

        strlist = "dictStr["
        for string in tempList:
            strlist += '"'+string+'"'+"]["

            #exec("print %s" %strlist[:-1])
        exec("a = type(%s) == types.DictType" % strlist[:-1])
        if not(a):
            # exec("for string in %s:print string;i+=1" %strlist[:-1])
            flag = 0
            break
        else:
            exec("tem = %s.keys()" % strlist[:-1])
        # exec("""for i in %s:
        # print i""" % strlist[:-1])


    for strr in tem:
        print str(i) + '.' + strr
        i+=1

    action = input("please choose a action (1-%d)>>>" %(i-1))

    if tem[action - 1] == "cancel" and action in range(1,i):
        tempList.pop()
    else:
        tempList.append(tem[action-1])

exec("magic = %s(player);magic.use(player)" % tempList[len(tempList) - 1])
print tempList[len(tempList) - 1]


    # if final and  tem[action-1] == "cancel" and action in range(1,i):
    #     tempList.pop()
    # elif not(final) and action in range(1,i):
    #     tempList.append(tem[action-1])

    # strlist = "dictStr["
    # for i in tempList:
    #     strlist += '"'+i+'"'+"]["
