class Person:
    def __init__(self, name, age, pay=0, job=None):
        self.name = name
        self.age  = age
        self.pay  = pay
        self.job  = job
    def lastName(self):
        return self.name.split( )[-1]
    def giveRaise(self, percent):
        self.pay *= (1.0 + percent)
    def __str__(self):
	    return '<%s => %s>' % (self.__class__.__name__, self.name)

if __name__ == '__main__':
    bob = Person('Bob Smith', 42, 30000, 'sweng')
    sue = Person('Sue Jones', 45, 40000, 'music')
    print bob.name, sue.pay

    print bob.lastName( )
    sue.giveRaise(.10)
    print sue.pay
    print bob
    print bob.__dict__
    for obj in bob.__dict__:
        print obj
        print bob.__dict__[obj]
