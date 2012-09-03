#-*- coding: utf-8 -*-

import Player
import LittleCureBottle
import Enemys
import Theurgy

player = Player.Player("wei",10,10, 10,10,10,10,0,10,1)

player._exp = 10

player.player_up()

print player._level
print player._hp, "/", player._maxHp
print player._mp, "/", player._maxMp
print player._strength

player.player_damage(10)
print player._hp

littleCureBottle = LittleCureBottle.LittleCureBottle()
littleCureBottle.use(player)

print player._hp




enemy = Enemys.Enemy1("a",10,0,0)
enemy1 = Enemys.Enemy1("b",20,0,0)
print enemy._hp
print enemy._name
print enemy1._hp
print enemy1._name


theurgy = Theurgy.Theurgy2(player)
theurgy.use(player)

print player._hp

#player._book[1].use(enemy)


print "------------------------------"

class A(object):
    """
    """

    def __init__(self, user):
        """
        """
        self.user = user

    def use(self, ):
        print self.user.name






class B(object):
    def __init__(self,name):
        self.name = name
        self.a = A(self)

b = B("B")
b.a.use()

c = B("C")
c.a.use()




while player._hp > 0:
    print "Please choose a action:"
    print "1.attack"
    print "2.defend"
    print "3.use book"
    action = raw_input("choose 1-3: ")

    if action == "1":
        player.player_damage(10)
        continue
    elif action == "2":
        continue
    elif action == "3":
        print "choose one Theurgy:"
        for book in player._book.keys():
            print book
        print "1.Theurgy1"
        print "2.Theurgy2"
        theurgy = raw_input("choose 1-2: ")
        if theurgy == "1":
            player._book["theurgy2"].use(player)
            continue
        elif theurgy == "2":
            player._book["theurgy2"].use(player)
            continue
        else:
            print "please input a vaild number"
            continue

    else:
        print "please input a vaild number"
        continue
