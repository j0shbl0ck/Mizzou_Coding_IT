""" USER INFORMATION 
Student: Josh Block
Date: 4/28/22
Version: 1.0.3 """

# create SQL connection
import mysql.connector

# ------------ VIEW DATA QUERY FUNCTIONS ------------ #

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
    #create query
    sqlquery2_1 = '''SELECT department_name, COUNT(department_name) AS "Number of Managers"
                    FROM managers
                    GROUP BY department_name
                    ORDER BY COUNT(department_name) DESC;'''

    #execute the query
    mycursor.execute(sqlquery2_1)

    #get the query result
    query_result = mycursor.fetchall()

    print("\nManagers per Department\n---------------------")
    #loop through results
    for record in query_result:
        print(f"{record[0]} Department: {record[1]} managers")
    
    return

    # Query the manager view to show department user inputted
def get_manager_count_by_department_specific(mycursor, department):
    #create query
    sqlquery2_2 = '''SELECT department_name, COUNT(department_name) AS "Number of Managers"
                    FROM managers
                    WHERE department_name = %s
                    GROUP BY department_name
                    ORDER BY COUNT(department_name) DESC;'''

    #execute the query
    mycursor.execute(sqlquery2_2, (department,))

    #get the query result
    query_result = mycursor.fetchall()

    print("\nManagers per Department\n---------------------")
    #loop through results
    for record in query_result:
        print(f"{record[0]} Department: {record[1]} managers")
    
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

    # Query the SalaryByDepartment view to show the salary per department
def get_salary_data_by_department(mycursor):
    sqlquery5_1 = "SELECT Department, Salary FROM SalaryByDepartment"
    mycursor.execute(sqlquery5_1)
    myresult5 = mycursor.fetchall()
    print("\nSalary data by department:")
    for x in myresult5:
        print(x)
    return

    # Query the SalaryByDepartment view to show department user inputted
def get_salary_data_by_department_specific(mycursor, department):
    sqlquery5_2 = "SELECT Department, Salary FROM SalaryByDepartment WHERE Department = %s"
    mycursor.execute(sqlquery5_2, (department,))
    myresult5 = mycursor.fetchall()
    print("\nSalary data by department:")
    for x in myresult5:
        print(x)
    return

    # Query the SalaryByJobTitle view to show show the job title and total salary for the title with the highest total salary
def get_salary_data_by_job_title(mycursor):
    sqlquery6_1 = "SELECT JobTitle, Salary FROM SalaryByJobTitle"
    mycursor.execute(sqlquery6_1)
    myresult6 = mycursor.fetchall()
    print("\nSalary data by job title:")
    for x in myresult6:
        print(x)
    return

    # Query the SalaryByJobTitle view to show job title user inputted
def get_salary_data_by_job_title_specific(mycursor, job_title):
    sqlquery6_2 = '''SELECT JobTitle, Salary 
                    FROM SalaryByJobTitle 
                    WHERE JobTitle = %s'''
    mycursor.execute(sqlquery6_2, (job_title,))
    myresult6 = mycursor.fetchall()
    print("\nSalary data by job title:")
    for x in myresult6:
        print(x)
    return

    # Query the EmployeeDependents view that calculates the number of dependents each employees has. This query should show employees even if they have 0 dependents. Display the employee name (first, last), email, phone number, and number of dependents. Hint: left or right join.
def get_dependent_data_by_employee(mycursor):
    sqlquery7_1 = '''SELECT EmployeeID, FirstName, LastName, Email, PhoneNumber, COUNT(Dependents.EmployeeID) 
                    FROM EmployeeDependents 
                    LEFT JOIN Dependents ON EmployeeDependents.EmployeeID = Dependents.EmployeeID 
                    GROUP BY EmployeeID'''

    # execute the query
    mycursor.execute(sqlquery7_1)

    # get the query result
    myresult7 = mycursor.fetchall()

    print("\nEmployee dependents:\n---------------------")
    # loop through results
    for x in myresult7:
        print(x)
    return

    # Query the EmployeeDependents view that calculates the number of dependents each employees has. This query should show employees even if they have 0 dependents. Display the employee name (first, last), email, phone number, and number of dependents. Hint: left or right join.
def get_employee_dependents_specific(mycursor, employee_id):
    sqlquery7_2 = '''SELECT EmployeeID, FirstName, LastName, Email, PhoneNumber, COUNT(Dependents.EmployeeID) 
                FROM EmployeeDependents 
                LEFT JOIN Dependents ON EmployeeDependents.EmployeeID = Dependents.EmployeeID WHERE EmployeeID = %s 
                GROUP BY EmployeeID'''
    mycursor.execute(sqlquery7_2, (employee_id,))
    myresult7 = mycursor.fetchall()
    print("\nEmployee dependents:")
    for x in myresult7:
        print(x)
    return

    # Query the CountryLocation view to show the number of locations in each country
def get_location_data_by_country(mycursor):
    sqlquery8_1 = '''SELECT Country, COUNT(LocationID) 
                    FROM CountryLocation 
                    GROUP BY Country'''
    mycursor.execute(sqlquery8_1)
    myresult8 = mycursor.fetchall()
    print("\nCountry location data:")
    for x in myresult8:
        print(x)
    return

    # Query the CountryLocation view to show country user inputted
def get_location_data_by_country_specific(mycursor, country):
    sqlquery8_2 = '''SELECT Country, COUNT(LocationID) 
                    FROM CountryLocation WHERE Country = %s 
                    GROUP BY Country'''
    mycursor.execute(sqlquery8_2, (country,))
    myresult8 = mycursor.fetchall()
    print("\nCountry location data:")
    for x in myresult8:
        print(x)
    return

# ------ END OF VIEW DATA QUERY FUNCTIONS ------ #

# ------------ ADD DATA QUERY FUNCTIONS ------------ #
    # Add a new dependent to the database
def add_dependent_data(mycursor, employee_id, first_name, last_name, birth_date):
    sqlquery9 = '''INSERT INTO Dependents (EmployeeID, FirstName, LastName, BirthDate) 
                    VALUES (%s, %s, %s, %s)'''
    mycursor.execute(sqlquery9, (employee_id, first_name, last_name, birth_date))
    return

    # Add a new job to the database
def add_job_data(mycursor, job_title, min_salary, max_salary):
    sqlquery10 = '''INSERT INTO Jobs (JobTitle, MinSalary, MaxSalary) 
                    VALUES (%s, %s, %s)'''
    mycursor.execute(sqlquery10, (job_title, min_salary, max_salary))
    return

# ------------ END OF ADD DATA QUERY FUNCTIONS ------------ #


# ------------ DELETE DATA QUERY FUNCTIONS ------------ #


# ------------ END OF DELETE DATA QUERY FUNCTIONS ------------ #

# ------------ UPDATE DATA QUERY FUNCTIONS ------------ #


# ------------ END OF UPDATE DATA QUERY FUNCTIONS ------------ #



# ----- MENU -----
def print_menu():
    print("")
    print("Choose an option")
    print("----------------")
    print("--------- VIEW DATA --------")
    print("1. View employees data per region")
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

# ----- END OF MENU ----- #

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

        elif user_choice == 5:
            # ask user if they want to view all data
            view_all = input("Do you want to view all data? (Y/N): ")
            if view_all == "Y":
                # view all data
                get_salary_data_by_department(mycursor)
            elif view_all == "N":
                # ask user if they want to view specific data
                view_specific = input("Do you want to view specific data? (Y/N): ")
                if view_specific == "Y":
                    # ask user for specific data
                    department = input("Enter department: ")
                    get_salary_data_by_department_specific(mycursor, department)
            else:
                print("Invalid input. Returning to main menu...")
                quit()
                
        elif user_choice == 6:
            # ask user if they want to view all data
            view_all = input("Do you want to view all data? (Y/N): ")
            if view_all == "Y":
                # view all data
                get_salary_data_by_job_title(mycursor)
            elif view_all == "N":
                # ask user if they want to view specific data
                view_specific = input("Do you want to view specific data? (Y/N): ")
                if view_specific == "Y":
                    # ask user for specific data
                    job_title = input("Enter job title: ")
                    get_salary_data_by_job_title_specific(mycursor, job_title)
            else:
                print("Invalid input. Returning to main menu...")
                quit()

        elif user_choice == 7:
            # ask user if they want to view all data
            view_all = input("Do you want to view all data? (Y/N): ")
            if view_all == "Y":
                # view all data
                get_dependent_data_by_employee(mycursor)
            elif view_all == "N":
                # ask user if they want to view specific data
                view_specific = input("Do you want to view specific data? (Y/N): ")
                if view_specific == "Y":
                    # ask user for specific data
                    employee_id = input("Enter employee: ")
                    get_employee_dependents_specific(mycursor, employee_id)
            else:
                print("Invalid input. Returning to main menu...")
                quit()

        elif user_choice == 8:
            # ask user if they want to view all data
            view_all = input("Do you want to view all data? (Y/N): ")
            if view_all == "Y":
                # view all data
                get_location_data_by_country(mycursor)
            elif view_all == "N":
                # ask user if they want to view specific data
                view_specific = input("Do you want to view specific data? (Y/N): ")
                if view_specific == "Y":
                    # ask user for specific data
                    country = input("Enter country: ")
                    get_location_data_by_country_specific(mycursor, country)
            else:
                print("Invalid input. Returning to main menu...")
                quit()
        
        elif user_choice == 9:
            # ask user if they would like to add a new dependent
            add_dependent = input("Do you want to add a new dependent? (Y/N): ")
            if add_dependent == "Y":
                # ask user for new dependent data
                add_dependent_data(mycursor)
            elif add_dependent == "N":
                print("Returning to main menu...")
                quit()
            else:
                print("Invalid input. Returning to main menu...")
                quit()

        elif user_choice == 10:
            # ask user if they would like to add a new job
            add_job = input("Do you want to add a new job? (Y/N): ")
            if add_job == "Y":
                # ask user for new job data
                add_job_data(mycursor)
            elif add_job == "N":
                print("Returning to main menu...")
                quit()
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

# --- END OF MAIN ---