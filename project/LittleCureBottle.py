#-*- coding: utf-8 -*-

class LittleCureBottle(object):
    """
    """

    def __init__(self, ):
        """
        """
        self._name = "LittleCureBottle"


    def use(self, player):
        """

        Arguments:
        - `self`:
        - `player`:
        """
        player._hp += 30
        if player._hp > player._maxHp:
            player._hp = player._maxHp
