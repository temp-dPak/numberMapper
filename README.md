# numberMapper
Number mapper assignment for ICICLE

As mentioned in the assignment, this is to map the telephone numbers on a cell phone to the possible set of words that can be formed.

== From the assignment description:

Given a 10 digit phone number, you should return all possible words or combinations of words from the provided dictionary, that can be mapped back as a whole to the number. 

With this we can generate numbers like 1-800-motortruck which is easier to remember than 1-800-6686787825.

The phone number mapping to letters is as follows:

2 = a b c
3 = d e f
4 = g h i
5 = j k l
6 = m n o
7 = p q r s
8 = t u v
9 = w x y z
 
The phone numbers will never contain a 0 or 1. 
Words have to be at least 3 characters.

===== How to run:
'NumberMapper' is the class which needs to be instantiated. The 'conductor' method is the master method that coordinates between other methods for the result.

A simple way to use:

"NumberMapper.new.conductor <your number here>"

Beware, the method does not accept any number less than 10 digits long.
