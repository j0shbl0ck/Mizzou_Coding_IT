#PaintJobEstimator//Josh Block
import math 
print ("Paint Job Estimator")
 
paint_calculation = True
while (paint_calculation):
#create variables
#Ask for square feet and price of paint input
    while (True):
        try:
            qsquare_feet = float(input("Square feet of wall space?  "))
            if (qsquare_feet < 0):
                print ("negative number error")
                continue
        except ValueError:
            print("numerical values only")
        else:
            break
    while (True):
        try:
            qpaint_price = float(input("Price of paint per gallon? $"))
            if (qpaint_price < 0):
                print ("negative number error")
                continue
        except ValueError:
            print("numberical values only")
        else:
            break
#variables beginning
    labor_hours = qsquare_feet/350 * (6)
    paint_gallons = math.ceil(qsquare_feet / 350)
    paint_gallons_costs = math.ceil(paint_gallons) * qpaint_price
    labor_hours_costs = labor_hours * 62.25
    overall_cost = (paint_gallons_costs + labor_hours_costs)
#variables end
#Finilize cost and other neccisties
    print ("Hours of labor required:",format(labor_hours,".1f"))
    print ("Gallons of paint required:",paint_gallons)
    print ("Cost of paint:$",format(paint_gallons_costs,".2f"))
    print ("Cost of labor charges:$",format(labor_hours_costs,".2f"))
    print ("Overall cost of project:$",format(overall_cost,".2f"))
#Need to run program again?
    another_estimation = input("Would you like to perform a new estimation? (Y/N): ").lower().strip()
    if (another_estimation != 'y'):
        print ("Program Closing...")
        print ("Program Terminated")
        raise SystemExit 
    else:
        paint_calculation = True

