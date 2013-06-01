objects = msgqueue.o getOtherID.o comm.o
VPATH = global
comm:$(objects)
	g++ -o comm $(objects) -lpthread

comm.o:global.h

getOther.o:getOtherID.h

msgqueue.o:msgqueue.h



clean:
	rm comm $(objects)

install:
	cp comm ~
