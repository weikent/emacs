import shelve
from initdata import bob, sue

db = shelve.open('people-shelve')
db['bob'] = bob
db['sue'] = sue
db.close()
