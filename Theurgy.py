#-*- coding: utf-8 -*-



class Attack(object):
    """
    """

    def __init__(self, user):
        """

        Arguments:
        - `user`:
        """
        self._user = user
        self._attackSurface = "one"
        self._name = "Attack"

    def use(self, enemy):
        """

        Arguments:
        - `self`:
        - `enemy`:
        """
        print "%s use %s attack %s, damage is 8" %(self._user._name,self._name, enemy._name)
        enemy._hp -=8


class Defend(object):
    """
    """

    def __init__(self, user):
        """

        Arguments:
        - `user`:
        """
        self._user = user
        self._attackSurface = "one"
        self._name = "Defend"

    def use(self, enemy):
        """
        
        Arguments:
        - `self`:
        - `enemy`:
        """
        print "%s defend" %(sefl._name)



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





class Fire1(object):
    """
    """

    def __init__(self, user):
        """

        Arguments:
        - `user`:
        """
        self._user = user
        self._attackSurface = "one"


    def use(self, enemy):
        """

        Arguments:
        - `self`:
        - `enemy`:
        """
        print "%s use Fire1 attach %s, damage is 8" %(self._user._name, enemy._name)
        enemy._hp -=8




class Fire2(object):
    """
    """

    def __init__(self, user):
        """

        Arguments:
        - `user`:
        """
        self._user = user
        self._attackSurface = "one"


    def use(self, enemy):
        """

        Arguments:
        - `self`:
        - `enemy`:
        """
        print "%s use Fire1 attach %s, damage is 8" %(self._user._name, enemy._name)
        enemy._hp -=8




class Fire3(object):
    """
    """

    def __init__(self, user):
        """

        Arguments:
        - `user`:
        """
        self._user = user
        self._attackSurface = "one"


    def use(self, enemy):
        """

        Arguments:
        - `self`:
        - `enemy`:
        """
        print "%s use Fire1 attach %s, damage is 8" %(self._user._name, enemy._name)
        enemy._hp -=8




class Earth1(object):
    """
    """

    def __init__(self, user):
        """

        Arguments:
        - `user`:
        """
        self._user = user
        self._attackSurface = "one"


    def use(self, enemy):
        """

        Arguments:
        - `self`:
        - `enemy`:
        """
        print "%s use Fire1 attach %s, damage is 8" %(self._user._name, enemy._name)
        enemy._hp -=8




class Earth2(object):
    """
    """

    def __init__(self, user):
        """

        Arguments:
        - `user`:
        """
        self._user = user
        self._attackSurface = "one"


    def use(self, enemy):
        """

        Arguments:
        - `self`:
        - `enemy`:
        """
        print "%s use Fire1 attach %s, damage is 8" %(self._user._name, enemy._name)
        enemy._hp -=8




class Earth3(object):
    """
    """

    def __init__(self, user):
        """

        Arguments:
        - `user`:
        """
        self._user = user
        self._attackSurface = "one"


    def use(self, enemy):
        """

        Arguments:
        - `self`:
        - `enemy`:
        """
        print "%s use Fire1 attach %s, damage is 8" %(self._user._name, enemy._name)
        enemy._hp -=8
