#-*- coding: utf-8 -*-

import types


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
dictStr = {"attack" : "attack",
           "defend" : "defend",
           "book" : {"cancel": "",
                     "土系" : ["土系1","土系2","土系3"],
                     "火系" : ["火系1","火系2","火系3"]
                     }
           }
tempList = []
flag = 1

while flag :
    i = 1
    tem = ""
    final = 0

    if len(tempList) == 0:
        tem = dictStr.keys()
        print "----"
    else:

        strlist = "dictStr["
        for string in tempList:
            strlist += '"'+string+'"'+"]["

        exec("a = type(%s) == types.ListType" % strlist[:-1])
        if a:
            # exec("for string in %s:print string;i+=1" %strlist[:-1])
            exec("tem = %s") % strlist[:-1]
            final = 1
        else:
            exec("tem = %s.keys()" % strlist[:-1])
        # exec("""for i in %s:
        # print i""" % strlist[:-1])


    for strr in tem:
        print str(i) + '.' + strr
        i+=1

    action = input("please choose a action (1-%d)>>>" %(i-1))

    if final and  tem[action-1] == "cancel" and action in range(1,i):
        tempList.pop()
        pass
    elif not(final) and action in range(1,i):
        tempList.append(tem[action-1])

    # strlist = "dictStr["
    # for i in tempList:
    #     strlist += '"'+i+'"'+"]["
