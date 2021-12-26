# Improved Position Calculation
# objectposncalc.py (improved)

print("This program calculates an object's final position.")

do_calculation = True
while(do_calculation):

    # Get information about the object from the user
    while (True):
        try:
            initial_position = float(input("\nEnter the object's initial position: "))
        except ValueError:
            print("The value you entered is invalid.  Only numerical values are valid.");
        else:
            break
        
    while (True):
        try:
            initial_velocity = float(input("Enter the object's initial velocity: "))
        except ValueError:
            print("The value you entered is invalid.  Only numerical values are valid.");
        else:
            break

    while (True):
        try:
            acceleration = float(input("Enter the object's acceleration: "))           
        except ValueError:
            print("The value you entered is invalid.  Only numerical values are valid.");
        else:
            break

    while (True):
        try:
            time_elapsed = float(input("Enter the time that has elapsed: "))
            if (time_elapsed < 0):
                print("Negative times are not allowed.")
                continue
        except ValueError:
            print("The value you entered is invalid.  Only numerical values are valid.");
        else:
            break

    # Calculate the final position
    final_position = initial_position + initial_velocity * time_elapsed + 0.5 * acceleration * time_elapsed ** 2

    # Output final position
    print("\nThe object's final position is", final_position)

    # Check if the user wants to perform another calculation
    another_calculation = input("\nDo you want to perform another calculation? (y/n): ")
    if (another_calculation != "y"):
        do_calculation = False
    
