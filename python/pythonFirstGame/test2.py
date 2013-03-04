#-*- coding: utf-8 -*-

from Player import *
from Battle import *
from Enemys import *



player = Player("wei",10,10, 10,10,10,10,0,10,1)

enemy = Enemy2("enemy2", 200)

enemy.action(0,player)
print "some sentence of gmae. blbl......"

print "That is too bad. Your meet a monster......"

print player._hp,enemy._hp
a =  Battle(player, enemy).call()


if a:
    print "Congratulation! You Win!"
else:
    print "...."
