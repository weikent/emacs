"""
alternative implementation of person clasees
data, behavior, and operator overloading
"""

class Person(object):
	"""
	a general person: data + logic
	"""
	
	def __init__(self, name, age, pay=0, job=None):
		"""
		
		Arguments:
		- `name`:
		- `age`:
		- `pay`:
		- `job`:
		"""
		self._name = name
		self._age = age
		self._pay = pay
		self._job = job
	def lastName(self):
		"""
		
		Arguments:
		- `self`:
		"""
		return self._name.split()[-1]
	def giveRaise(self, percent):
		"""
		
		Arguments:
		- `self`:
		- `percent`:
		"""
		self._pay *= (1.0 + percent)
	def __str__(self):
		"""
		
		Arguments:
		- `self`:
		"""
		return ('<%s => %s : %s, %s>' % (self.__class__.__name__, self._name, self._job, self._pay))

class Manager(Person):
	"""
	a person with custom raise
	inherits general lastname, str
	
	"""
	
	def __init__(self, name, age, pay):
		"""
		
		Arguments:
		- `name`:
		- `age`:
		- `pae`:
		"""
		self._name = name
		self._age = age
		self._pay = pay
		Person.__init__(self, name, age, pay, 'manager')
	def giveRaise(self, percent, bonus = 0.1):
		"""
		
		Arguments:
		- `self`:
		- `percent`:
		- `bonus`:
		"""
		Person.giveRaise(self, percent + bonus)

if __name__ == '__main__':
	bob = Person('Bob Smith', 44)
	sue = Person('Sue Jones', 47, 40000, 'music')
	tom = Manager(name = 'Tom Doe', age=50, pay= 50000)
	print sue, sue._pay, sue.lastName()
	for obj in (bob, sue, tom):
		obj.giveRaise(.10)
		print obj







