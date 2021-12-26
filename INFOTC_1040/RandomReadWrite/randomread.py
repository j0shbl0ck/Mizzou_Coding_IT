##Josh Block // Random Read

def main():
    while (True):
        try:
            #Open the random_numfile.txt file for reading.
            random_numfile = open('random_numfile.txt', 'r')

            #Make a variable
            count = 0

            #Retrive values from the file.
            for line in random_numfile:
                arnumber = float(line)
                num_randomnumbers = float(line)

                #Add 1 to the count variable
                count += 1

                #Print random numbers
                print(arnumber, sep='')

                #Call in random number input from write file
                rntotal = num_randomnumbers
        except Exception as error:
                print("File Not Found",error)
                raise SystemExit 
        else:
            #Display random number count
            print('Random Number Count:',count)
            break

    #Close the file.
    random_numfile.close()

#Call the main function.
main() 
    
