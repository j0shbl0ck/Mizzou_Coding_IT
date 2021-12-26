##Josh Block // Random Write
import random

def main():
    #Get amount of random number user wants.
    while (True):
        try:
            num_randomnumbers = int(input('How many random numbers do you want? '))
            if (num_randomnumbers <= 0):
                print ("Negative numbers are not allowed.")
                continue
        except ValueError:
                print("The input entered is invalid. Only numberical values are valid.")
        else:
            break
    #Create and open file to hold amount of random numbers
    random_numfile= open('random_numfile.txt', 'a')

    #Have user enter in lowest and highest random number range
    while (True):
        try:
            lrnumber = int(input('What is the lowest the random number should be: '))
            if (lrnumber <= 0):
                print ("Negative numbers are not allowed.")
                continue
        except ValueError:
                print("The input entered is invalid. Only numberical values are valid.")
        else:
            break
    while (True):
        try:
            hrnumber = int(input('What is the highest the random number should be: '))
            if (hrnumber <= 0):
                print ("Negative numbers are not allowed.")
                continue
        except ValueError:
                print("The input entered is invalid. Only numberical values are valid.")
        else:
            break
    #Generate random numbets to write to the file.
    for counter in range(num_randomnumbers):
        arnumber = (random.randrange(lrnumber, hrnumber))
        random_numfile.write(str(arnumber) + '\n')

    #Close the file.
    random_numfile.close()
    print('The random numbers have been saved to: random_numfile.txt.')

#Call the main function
main() 

