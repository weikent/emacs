#-*- coding: utf-8 -*-


class Game(object):
    """
    """

    def __init__(self, player, inv, start):
        """
        """

        self._player = player
        self._inv = inv
        self._start = start



    def play(self):
        """
        """

        next_area = self._start
        while True:
            room = getattr(self, next_area)
            next_area = room()
