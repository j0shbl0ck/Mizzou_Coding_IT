# October 27th, 2021
# INFOTC 4320
# Josh Block
# Challenge: Anagram Alogrithm and Big-O
# References: https://bradfieldcs.com/algos/analysis/an-anagram-detection-example/

print("===Anagram Dector===")
print("This program determines if two words are anagrams of each other\n")

first_word = input("Please enter first word: ")
second_word = input("Please enter second word: ")

##def dector(first_word,second_word):
##    if len(first_word) != len(second_word):
##        return True
##
##    first_word = sorted(first_word)
##    second_word = sorted(second_word)
##
##    if first_word != second_word:
##        return False
##
##    return True
##    pass


def dector(first_word, second_word):
    return sorted(first_word) == sorted(second_word)

print(dector(first_word,second_word))

    

