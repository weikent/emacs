objects = local.o msgqueue.o

local:$(objects)
	g++ -o local $(objects)

local.o:
msgqueue.o:msgqueue.h



clean:
	rm local $(objects)

install:
	cp local ~
