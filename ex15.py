#-*- coding: utf-8 -*-


# from sys import argv

# script, filename = argv

# txt = open(filename)

# print "Here is your file %r:" % filename
# print txt.read()


print "Type the filename again:"
file_again = raw_input("> ")

txt_again = open(file_again,"a+")

print txt_again.readline()
# print txt_again.tell()
# txt_again.seek(10)
#txt_again.write("write use write()")
print txt_again.tell()
txt_again.seek(20,0)
print txt_again.tell()
txt_again.truncate(5)

# print txt_again.readline()

txt_again.close()
