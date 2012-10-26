#-*- coding: utf-8 -*-

"I am 6'2\" tall." #
'I am 6\'2" tall.' #

tabby_cat = "\tI'm tabbed in."
persian_cat = "I'm split\non a line."
backslash_cat = "I'm \\ a \\ cat."

fat_cat = '''
I'll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass
'''

print tabby_cat
print persian_cat
print backslash_cat
print fat_cat

print "%s" %'%s \\r'

# %r打印出来的是你写在脚本里的内容，而%s打印的是你应该看到的内容
