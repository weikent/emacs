#-*- coding: utf-8 -*-
import types

class Menu(object):
    """
    """

    def __init__(self, menu):
        """

        Arguments:
        - `Menu`:
        """
        self._menu = menu


    def show(self):
        """

        Arguments:
        - `self`:
        """
        flag = True
        dictStr = self._menu
        tempList = []

        while flag:
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

            action = raw_input("please choose a action (1-%d)>>>" %(i-1))

            if action <> "":
                action = int(action)
            else:
                continue


            if  action in range(1,i) and tem[action - 1] == "Cancel":
                tempList.pop()
            elif  action in range(1,i):
                tempList.append(tem[action-1])
            else:
                print "unknown choose...."


                #        exec("magic = %s(player);magic.use(player)" % tempList[len(tempList) - 1])
        print tempList[len(tempList) - 1]
        return tempList[len(tempList) - 1]
