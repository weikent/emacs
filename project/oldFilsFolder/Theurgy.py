#-*- coding: utf-8 -*-


class Theurgy1(object):
    """
    """

    def __init__(self, user):
        """

        Arguments:
        - `attackSurface`:
        """
        self._attackSurface = "all"
        self._user = user



    def use(self, enemys):
        """

        Arguments:
        - `self`:
        - `enemys`:
        """

        for enemy in enemys:
            print "%s Theurgy2 attack %s, damage is 8" % (self._user._name,enemy._name)
            enemy._hp -=10



class Theurgy2(object):
    """
    """

    def __init__(self, user):
        """

        Arguments:
        - `attackSurface`:
        """
        self._attackSurface = "one"
        self._user = user


    def use(self, enemy):
        """

        Arguments:
        - `self`:
        - `enemy`:
        """
        print "%s use Theurgy2 attack %s, damage is 8" %(self._user._name, enemy._name)
        enemy._hp -=8
