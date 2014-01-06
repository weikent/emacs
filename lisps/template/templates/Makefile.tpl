### Makefile.tpl --- (>>>POINT<<<)

## Author: (>>>AUTHOR<<<)
## Version: $Id: (>>>FILE<<<),v 0.0 (>>>VC_DATE<<<) (>>>LOGIN_NAME<<<) Exp $
## Keywords: (>>>1<<<)
## X-URL: (>>>2<<<)


### (>>>FILE<<<) ends here



CC = gcc
CXX = g++

VPATH = 
INCLUDE = 
WALL = -Wall
C99 = #-std=c99

SOURCECPP =

SOURCEC =

OBJECTSCPP = $(SOURCECPP:%.cpp=%.o)

OBJECTSC = $(SOURCEC:%.c=%.o)

OBJS = $(OBJECTSC) $(OBJECTSCPP)


TARGET = 

.PHONY = all
.PHONY = clean
all = clean $(TARGET)

%.o : %.c
	$(CC) -c $(WALL)  $< -o $@ $(INCLUDE) $(C99)

%.o : %.cpp
	$(CXX) -c $(WALL) $< -o $@ $(INCLUDE)

$(TARGET): $(OBJECTSC) $(OBJECTSCPP)
	$(CC) -o $(TARGET) $(INCLUDE)  $(OBJECTSC) $(OBJECTSCPP)  -lpthread -lm -O2 $(C99)


clean:
	rm $(OBJS) $(TARGET)

install:
#	cp *.h *.cpp *.c -r ../wpa
