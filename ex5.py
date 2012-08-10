#-*- coding: utf-8 -*-

my_name = 'Zed A. Shaw'
my_age = 35 # not a lie
my_height = 74 # inches
my_weight = 180 #lbs
my_eyes = 'Blue'
my_teeth = 'White'
my_hair = 'Brown'

print "Let's talk about %s." %my_name
print "He's %d inches tall." %my_height
print "He's %d pounds heavy." %my_weight
print "Actually that's not too heavy."
print "He's got %s eyes and %s hair." %(my_eyes, my_hair)
print "His teeth are usually %s depending on the coffee." %my_teeth

#this line is tricky, try to get it exactly right
print "If I add %d, %d, and %d I get %d." %(my_age, my_height,
                                            my_weight, my_age+my_height+my_weight)

print "this is %11.2f"  %my_age

print "Today's stock price: %f" %50.4534
print "Change since yesterday: %+.2f" %1.4
print "Change since yesterday: %+.2f" %-1.4

#print '%d%d' %4

a = '%d'
b = '%d' %4
print a+b
