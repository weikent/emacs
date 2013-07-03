objects = msgqueue.o getOtherID.o comm.o cJSON.o dataParse.o
VPATH = global
comm:$(objects)
	g++ -o comm $(objects) -lpthread -lm

cJSON.o:cJSON.h

dataParse.o:dataParse.h

comm.o:global.h

getOther.o:getOtherID.h

msgqueue.o:msgqueue.h



clean:
	rm comm $(objects)

install:
	cp comm ~
