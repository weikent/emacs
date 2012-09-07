#-*- coding: utf-8 -*-

class Inventory(object):
    """
    """

    def __init__(self, ):
        """
        """

        self._items = {}



    def add_item(self, item, amount):
        """

        Arguments:
        - `self`:
        - `item`:
        - `amount`:
        """
        if item in self._items:
            self._items[item] += amount
        else:
            self._items[item] = amount



    def remove_item(self, item, amount):
        """

        Arguments:
        - `self`:
        - `item`:
        - `amount`:
        """
        if item in self._items and self._items[item] >= amount:
            self._items[item] -= amount
            if self._items[item] == 0:
                del self._items[item]
            return True
        else:
            return False


    
