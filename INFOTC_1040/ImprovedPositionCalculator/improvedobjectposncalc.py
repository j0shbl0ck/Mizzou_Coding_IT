#BLOCK ObjectPosnCalc.py // Module 4
#Beginning of code#
print("Object Position Calculator")
while (True):
    try:
        x0 = float(input("Input Inital Position: "))
        if (x0 < 0):
            print ("Negative numbers are not allowed.")
            continue 
    except ValueError:
            print("The input entered is invalid. Only numerical values are valid.")
    else:
        break
do_calculation = True
while (do_calculation):
    Question = input("Do you want to proceed to the next calculation - Inital Velocity? (Y/N): ").lower().strip()
    if (Question != 'y'):
        print ("Program Closing...")
        print ("Program Terminated")
        raise SystemExit 
    else:
        do_calculation = False
##############################
while (True):
    try:
        v0 = float(input("Input Inital Velocity: "))
        if (v0 < 0):
            print ("Negative numbers are not allowed.")
            continue 
    except ValueError:
            print("The input entered is invalid. Only numerical values are valid.")
    else:
        break

do_calculation = True
while (do_calculation):
    Question = input("Do you want to proceed to the next calculation - Acceleration? (Y/N): ").lower().strip()
    if (Question != 'y'):
        print ("Program Closing...")
        print ("Program Terminated")
        raise SystemExit 
    else:
        do_calculation = False
##############################
while (True):
    try:
        a = float(input("Input Acceleration: "))
        if (v0 < 0):
            print ("Negative numbers are not allowed.")
            continue 
    except ValueError:
            print("The input entered is invalid. Only numerical values are valid.")
    else:
        break

do_calculation = True
while (do_calculation):
    Question = input("Do you want to proceed to the next calculation - Time? (Y/N): ").lower().strip()
    if (Question != 'y'):
        print ("Program Closing...")
        print ("Program Terminated")
        raise SystemExit 
    else:
        do_calculation = False
##############################
while (True):
    try:
        t = float(input("Input Time: "))
        if (t < 0):
            print ("Negative numbers are not allowed.")
            continue 
    except ValueError:
            print("The input entered is invalid. Only numerical values are valid.")
    else:
        break

do_calculation = True
while (do_calculation):
    Question = input("Calculate Final Position of Object? (Y/N): ").lower().strip()
    if (Question != 'y'):
        print ("Program Closing...")
        print ("Program Terminated")
        raise SystemExit 
    else:
        do_calculation = False
##############################
final_position = x0+v0*t+.5*a*t**2 # xf = x0 + v0 * t + 0.5 * a * t * t
print("Final Position:",final_position)






