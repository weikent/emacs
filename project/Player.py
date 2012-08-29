#-*- coding: utf-8 -*-

import Theurgy

class Player(object):
    """
    """

    def __init__(self, name, hp, maxHp,  mp, maxMp, strength, power, exp, maxExp, level):
        """

        Arguments:
        - `name`:
        - `hp`:
        - `maxHp`:
        - `mp`:
        - `maxMp`:
        - `strength`:
        - `power`:
        - `exp`:
        - `maxExp`:
        - `level`:
        """
        self._name = name
        self._hp = hp
        self._maxHp = maxHp
        self._mp = mp
        self._maxMp = maxMp
        self._strength = strength
        self._power = power
        self._exp = exp
        self._maxExp = maxExp
        self._level = level
        # self._book = [Theurgy.Theurgy1(self), Theurgy.Theurgy2(self)]
        self._book = {"theurgy1" : Theurgy.Theurgy1(self),
                      "theurgy2" : Theurgy.Theurgy2(self)
                      }


    def player_up(self):
        """
        """
        if self._exp >= self._maxExp:
            self._level += 1
            self._exp = 0
            self._maxExp = 2 * self._maxExp
            self._strength = 1.5 * self._strength
            self._power = 1.5 * self._power
            self._hp = (self._level + 1) * (self._strength + self._power)
            self._maxHp = self._hp
            self._mp = self._maxHp / 2
            self._maxMp = self._maxHp / 2


    def player_damage(self, damage):
        """

        Arguments:
        - `damage`:
        """
        self._hp -= damage
        if self._hp < 0:
            self._hp = 0


    def player_drain(self, mp):
        """

        Arguments:
        - `mp`:
        """
        self._mp -= mp
        if self._mp < 0:
            self._mp = 0
