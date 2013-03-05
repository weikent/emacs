#-*- coding: utf-8 -*-

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
    
    def __init__(self, name, hp, theurgy, items):
        """
        
        Arguments:
        - `name`:
        - `hp`:
        - `theurgy`:
        - `items`:
        """
        super(Enemy1, self).__init__(name,hp)
        self._theurgy = theurgy
        self._items = items
        

        
