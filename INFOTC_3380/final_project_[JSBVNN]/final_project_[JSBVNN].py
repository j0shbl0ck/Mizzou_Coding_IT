""" USER INFORMATION 
Student: Josh Block
Date: 4/28/22
Version: 1.0.0 """

# create SQL connection
import mysql.connector

    # Query the EmployeesPerRegion to show the number of employees per region
def get_employees_data(mycursor):
    sqlquery1_1 = "SELECT Region, COUNT(EmployeeID) FROM EmployeesPerRegion GROUP BY Region"
    mycursor.execute(sqlquery1_1)
    myresult1_1 = mycursor.fetchall()
    print("\nEmployees per region:")
    for x in myresult1_1:
        print(x)
    return

    # Query the EmployeesPerRegion to show region user inputted
def get_employees_data_per_region(mycursor, region):
    sqlquery1_2 = "SELECT Region, COUNT(EmployeeID) FROM EmployeesPerRegion WHERE Region = %s GROUP BY Region"
    mycursor.execute(sqlquery1_2, (region,))
    myresult1_2 = mycursor.fetchall()
    print("\nEmployees per region:")
    for x in myresult1_2:
        print(x)
    return

    # Query the manager view to show the number of managers per department
def get_manager_count_by_department(mycursor):
    sqlquery2_1 = "SELECT Department, COUNT(EmployeeID) FROM ManagerView GROUP BY Department"
    mycursor.execute(sqlquery2_1)
    myresult2 = mycursor.fetchall()
    print("\nManager count by department:")
    for x in myresult2:
        print(x)
    return

    # Query the manager view to show department user inputted
def get_manager_count_by_department_specific(mycursor, department):
    sqlquery2_2 = "SELECT Department, COUNT(EmployeeID) FROM ManagerView WHERE Department = %s GROUP BY Department"
    mycursor.execute(sqlquery2_2, (department,))
    myresult2 = mycursor.fetchall()
    print("\nManager count by department:")
    for x in myresult2:
        print(x)
    return

    # Query the DependentsByDepartment view to show the number of dependents per department
def get_dependent_data(mycursor):
    sqlquery3_1 = "SELECT Department, COUNT(EmployeeID) FROM DependentsByDepartment GROUP BY Department"
    mycursor.execute(sqlquery3_1)
    myresult3 = mycursor.fetchall()
    print("\nDependent count by department:")
    for x in myresult3:
        print(x)
    return

    # Query the DependentsByDepartment view to show department user inputted
def get_dependent_data_specific(mycursor, department):
    sqlquery3_2 = "SELECT Department, COUNT(EmployeeID) FROM DependentsByDepartment WHERE Department = %s GROUP BY Department"
    mycursor.execute(sqlquery3_2, (department,))
    myresult3 = mycursor.fetchall()
    print("\nDependent count by department:")
    for x in myresult3:
        print(x)
    return

    # Query the HiresByYear view to show the number of employees hired per year
def get_hiring_data(mycursor):
    sqlquery4_1 = "SELECT Year, COUNT(EmployeeID) FROM HiresByYear GROUP BY Year"
    mycursor.execute(sqlquery4_1)
    myresult4 = mycursor.fetchall()
    print("\nHiring data by year:")
    for x in myresult4:
        print(x)
    return

    # Query the HiresByYear view to show year user inputted
def get_hiring_data_specific(mycursor, year):
    sqlquery4_2 = "SELECT Year, COUNT(EmployeeID) FROM HiresByYear WHERE Year = %s GROUP BY Year"
    mycursor.execute(sqlquery4_2, (year,))
    myresult4 = mycursor.fetchall()
    print("\nHiring data by year:")
    for x in myresult4:
        print(x)
    return










# ----- MENU -----
def print_menu():
    print("Choose an option")
    print("----------------")
    print("--------- VIEW DATA --------")
    print("1. View employees datat per region")
    print("2. View manager count by department")
    print("3. View dependent data per department")
    print("4. View hiring data by year")
    print("5. View Salary data by department")
    print("6. View Salary data by job title")
    print("7. View dependent data by employee")
    print("8. View location data by country")
    print("--------- ADD DATA --------")
    print("9.  Add new dependent")
    print("10. Add a job")
    print("--------- DELETE DATA --------")
    print("11. Delete an employee")
    print("12. Delete a dependent")
    print("--------- UPDATE DATA --------")
    print("13. Update employee first name")
    print("14. Update employee last name")
    print("15. Update job minimum salary")
    print("16. Update job maximum salary")
    print("--------- EXIT --------")
    print("17. Exit Application")
    return

def get_user_choice():
    print_menu()
    choice = int(input("Enter Choice: "))
    return choice

# -----  MAIN FUNCTION -----

def main():
#create a connector object
    try:
        mydb = mysql.connector.connect(
            host="mysql-container",
            user="root",
            passwd="root",
            database="project2"
        )
        print("Successfully connected to the database!")
    except Exception as err:
        print(f"Error Occured: {err}\nExiting program...")
        quit()

    #create database cursor
    mycursor = mydb.cursor()

    while(True):
        user_choice = get_user_choice()
        if user_choice == 1:
            # ask user if they want to view all data
            view_all = input("Do you want to view all data? (Y/N): ")
            if view_all == "Y":
                # view all data
                get_employees_data(mycursor)
            elif view_all == "N":
                # ask user if they want to view specific data
                view_specific = input("Do you want to view specific data? (Y/N): ")
                if view_specific == "Y":
                    # ask user for specific data
                    region = input("Enter region: ")
                    get_employees_data_per_region(mycursor, region)
            else:
                print("Invalid input. Returning to main menu...")
                quit()
        elif user_choice == 2:
            # ask user if they want to view all data
            view_all = input("Do you want to view all data? (Y/N): ")
            if view_all == "Y":
                # view all data
                get_manager_count_by_department(mycursor)
            elif view_all == "N":
                # ask user if they want to view specific data
                view_specific = input("Do you want to view specific data? (Y/N): ")
                if view_specific == "Y":
                    # ask user for specific data
                    department = input("Enter department: ")
                    get_manager_count_by_department_specific(mycursor, department)
            else:
                print("Invalid input. Returning to main menu...")
                quit()

        elif user_choice == 3:
            # ask user if they want to view all data
            view_all = input("Do you want to view all data? (Y/N): ")
            if view_all == "Y":
                # view all data
                get_dependent_data(mycursor)
            elif view_all == "N":
                # ask user if they want to view specific data
                view_specific = input("Do you want to view specific data? (Y/N): ")
                if view_specific == "Y":
                    # ask user for specific data
                    department = input("Enter department: ")
                    get_dependent_data_specific(mycursor, department)
            else:
                print("Invalid input. Returning to main menu...")
                quit()

        elif user_choice == 4:
            # ask user if they want to view all data
            view_all = input("Do you want to view all data? (Y/N): ")
            if view_all == "Y":
                # view all data
                get_hiring_data(mycursor)
            elif view_all == "N":
                # ask user if they want to view specific data
                view_specific = input("Do you want to view specific data? (Y/N): ")
                if view_specific == "Y":
                    # ask user for specific data
                    year = input("Enter year: ")
                    get_hiring_data_specific(mycursor, year)
            else:
                print("Invalid input. Returning to main menu...")
                quit()
            
        elif user_choice == 17:
            #call the function to exit the application
            print("Bye Bye!!!")
            break
        else:
            print("Invalid choice. Please try again.")
main()