#-*- coding: utf-8 -*-


from Menu import *
from Theurgy import *

class Battle(object):
    """
    """

    def __init__(self, player, enemy):
        """

        Arguments:
        - `player`:
        - `enemy`:
        """
        self._player = player
        self._enemy = enemy

    def call(self):
        """
        
        Arguments:
        - `self`:
        """
        
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


        while True:
            print self._player._hp, self._enemy._hp
            if self._player._hp <= 0:
                return False
            if self._enemy._hp <= 0:
                return True

            theurgy = Menu(dictStr).show()

            exec("magic = %s(self._player);magic.use(self._enemy)" % theurgy)
