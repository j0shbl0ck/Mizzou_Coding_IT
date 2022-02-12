### Josh Block
## INFOTC 1040 
# Improved Calculate the Volume of a Cylinder

import math

do_calculation = True
while (do_calculation):
    while (True):
        try:
            radius = float(input("What is the radius of the cylinder?")) # ask for radius from user
            if (radius < 0): # checks if value is negative
                print("Negative value error")
                continue # loops back to while loop
        except ValueError:
            print("Your input is invalid, please state a numerical value.") # catches non-numerical value
        else:
            break
    while (True):
        try:
            height = float(input("What is the height of the cylinder")) #ask for height from user
            if (height < 0): # checks if value is negative
                print("Negative value error")
                continue # loops back to while loop
        except ValueError:
            print("Your input is invalid, please state a numerical value.") # catches non-numerical value
        else:
            break

    cylindervolume = (math.pi) * (radius ** 2 ) * height # Performs math problem
    print("The volume of the cylinder is", cylindervolume, "units cubed.")

    new_problem = input("Do you want to do another calculation? Y/N").lower().strip() # converts uppercase letters to lower case
    if (new_problem != 'y'): # if anything else than "y" is entered, program closes
        print ("Program Closing...")
        raise SystemExit # closes terminal
    else:
        do_calculation = True # loops back to while(do_calculation)