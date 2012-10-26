f = open("HelloWorld.py")
line = f.readline()
while line:
    print (line)
    line = f.readline()
f.close()