#-*- coding: utf-8 -*-

print 'import ex25'
import ex25

print 'sentence = "All good things come to those who wait."'
sentence = "All good things come to those who wait."

print 'words = ex25.break_words(sentence)'
words = ex25.break_words(sentence)
print 'words = ', words


print "----------"
print "sort words"
print "sorted_words = ex25.sort_words(words)"
sorted_words = ex25.sort_words(words)
print 'sorted_words = ', sorted_words

print "----------"
print "first word"
print "ex25.print_first_word(words)"
print "first word = ", ex25.print_first_word(words)

print "----------"
print "last word"
print "ex25.print_last_word(words)"
print "last word = ", ex25.print_last_word(words)

print "----------"
print "now words"
print "words = ", words

print "----------"
print "first sorted words"
print "ex25.print_first_word(sorted_words)"
print "first sorted words = ", ex25.print_first_word(sorted_words)

print "----------"
print "last sorted words"
print "ex25.print_last_word(sorted_words)"
print "last sorted words = ", ex25.print_last_word(sorted_words)

print "----------"
print "now sorted words"
print "sorted words = ", sorted_words

print "----------"
print "make new sorted words by sort sentence"
print "sorted_words = ex25.sort_sentence(sentence)"
ex25.sort_sentence(sentence)
print "sorted_words = ", sorted_words

print "----------"
print "first and last word of sentence"
print "ex25.print_first_and_last(sentence)"
ex25.print_first_and_last(sentence)

print "----------"
print "first and last word of sorted sentence"
print "ex25.print_first_and_last_sorted(sentence)"
ex25.print_first_and_last_sorted(sentence)
