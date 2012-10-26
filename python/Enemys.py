#-*- coding: utf-8 -*-

from Theurgy import *


class Enemy(object):
    """
    """

    def __init__(self, name, hp):
        """

        Arguments:
        - `name`:
        - `hp`:
        """
        self._name = name
        self._hp = hp




class Enemy1(Enemy):
    """
    """

    def __init__(self, name, hp):
        """

        Arguments:
        - `name`:
        - `hp`:
        - `theurgy`:
        - `items`:
        """
        super(Enemy1, self).__init__(name,hp)
        self._action = [Attack, Defend, Fire1, Earth1]



class Enemy2(Enemy):
    """
    """

    def __init__(self, name, hp):
        """

        Arguments:
        - `name`:
        - `hp`:
        - `theurgy`:
        - `items`:
        """
        super(Enemy2, self).__init__(name, hp)
        self._action = [Attack, Defend, Fire1, Earth3]

    def action(self,num,to):
        print self._action[num]
        exec("magic = %s(to);magic.use(to)" % "Attack")


class Enemy3(Enemy):
    """
    """

    def __init__(self, name, hp):
        """

        Arguments:
        - `name`:
        - `hp`:
        - `theurgy`:
        - `items`:
        """
        super(Enemy3, self).__init__(name, hp)
        self._action = [Attack, Defend, Fire1, Earth2]


class Enemy4(Enemy):
    """
    """

    def __init__(self, name, hp):
        """

        Arguments:
        - `name`:
        - `hp`:
        - `theurgy`:
        - `items`:
        """
        super(Enemy4, self).__init__(name, hp)
        self._action = [Attack, Defend, Fire2, Earth1]
