""" USER INFORMATION 
Student: Josh Block
Date: 4/28/22
Version: 1.5.4 """

# create SQL connection
import mysql.connector

# ------------ VIEW DATA QUERY FUNCTIONS ------------ #

    # Query the EmployeesPerRegion to show the number of employees per region [COMPLETE]
def get_employees_data(mycursor):
    sqlquery1_1 = '''SELECT * 
                    FROM EmployeesPerRegion;'''
    mycursor.execute(sqlquery1_1)
    myresult1_1 = mycursor.fetchall()
    print("\nEmployees per region\n---------------------")
    for x in myresult1_1:
        print(x)
    return

    # Query the EmployeesPerRegion to show the number of employees region user inputted [COMPLETE]
def get_employees_data_per_region(mycursor, region_name):
    sqlquery1_2 = '''SELECT *
                    FROM EmployeesPerRegion
                    WHERE region_name = %s;'''
    mycursor.execute(sqlquery1_2, (region_name,))
    myresult1_2 = mycursor.fetchall()
    print("\nEmployees per region:")
    for x in myresult1_2:
        print(f"{x[0]} Region: {x[1]} employees")
    return

    # Query the manager view to show the number of managers per department [COMPLETE]
def get_manager_count_by_department(mycursor):
    #create query
    sqlquery2_1 = '''SELECT departments.department_name, COUNT(managers.first_name) AS Number_of_Managers 
                    FROM managers
                    JOIN departments ON managers.department_name = departments.department_name
                    GROUP BY departments.department_name;'''

    #execute the query
    mycursor.execute(sqlquery2_1)

    #get the query result
    query_result = mycursor.fetchall()

    print("\nManagers per Department\n---------------------")
    #loop through results
    for record in query_result:
        print(f"{record[0]} Department: {record[1]} managers")
    return

    # Query the manager view to show department user inputted [COMPLETE]
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

    # Query the DependentsByDepartment view to show the number of dependents per department [COMPLETE]
def get_dependent_data(mycursor):
    sqlquery3_1 = '''SELECT *
                    FROM DependentsByDepartment;'''
    mycursor.execute(sqlquery3_1)
    myresult3 = mycursor.fetchall()
    print("\nDependent count by department\n---------------------")
    for x in myresult3:
        print(f"{x[0]} Department: {x[1]} dependents")
    return

    # Query the DependentsByDepartment view to show department user inputted [COMPLETE]
def get_dependent_data_specific(mycursor, department):
    sqlquery3_2 = '''SELECT *
                    FROM DependentsByDepartment
                    WHERE department_name = %s;'''
    mycursor.execute(sqlquery3_2, (department,))
    myresult3 = mycursor.fetchall()
    print("\nDependent count by department\n---------------------")
    for x in myresult3:
        print(f"{x[0]} Department: {x[1]} dependents")
    return

    # Query the HiresByYear view to show the number of employees hired per year [COMPLETE]
def get_hiring_data(mycursor):
    sqlquery4_1 = '''SELECT *
                    FROM HiresByYear;'''
    mycursor.execute(sqlquery4_1)
    myresult4 = mycursor.fetchall()
    print("\nHiring data by year\n---------------------")
    for x in myresult4:
        print(f"{x[0]} Year: {x[1]} employees")
    return

    # Query the HiresByYear view to show year user inputted [COMPLETE]
def get_hiring_data_specific(mycursor, year): 
    sqlquery4_2 = '''SELECT *
                    FROM HiresByYear
                    WHERE Hire_Year = %s;'''
    mycursor.execute(sqlquery4_2, (year,))
    myresult4 = mycursor.fetchall()
    print("\nHiring data by year\n---------------------")
    for x in myresult4:
        print(f"{x[0]} Year: {x[1]} employees")
    return

    # Query the SalaryByDepartment view to show the salary per department [COMPLETE]
def get_salary_data_by_department(mycursor):
    sqlquery5_1 = '''SELECT *
                    FROM SalaryByDepartment;'''
    mycursor.execute(sqlquery5_1)
    myresult5 = mycursor.fetchall()
    print("\nSalary data by department\n---------------------")
    for x in myresult5:
        print(f"{x[0]} Department: {x[1]} salary")
    return

    # Query the SalaryByDepartment view to show department user inputted [COMPLETE]
def get_salary_data_by_department_specific(mycursor, department):
    sqlquery5_2 = '''SELECT *
                    FROM SalaryByDepartment
                    WHERE department_name = %s;'''
    mycursor.execute(sqlquery5_2, (department,))
    myresult5 = mycursor.fetchall()
    print("\nSalary data by department:")
    for x in myresult5:
        print(f"{x[0]} Department: {x[1]} salary")
    return

    # Query the jobs table to show show the job title and total salary for the title with the highest total salary [COMPLETE]
def get_salary_data_by_job_title(mycursor):
    sqlquery6_1 = '''SELECT *
                    FROM jobs;'''
    mycursor.execute(sqlquery6_1)
    myresult6 = mycursor.fetchall()
    print("\nSalary data by job title\n---------------------")
    for x in myresult6:
        print(f"{x[0]} Job Title: {x[1]} salary")
    return

    # Query the jobs table to show job title user inputted [COMPLETE]
def get_salary_data_by_job_title_specific(mycursor, job_title):
    sqlquery6_2 = '''SELECT *
                    FROM jobs
                    WHERE job_title = %s;'''
    mycursor.execute(sqlquery6_2, (job_title,))
    myresult6 = mycursor.fetchall()
    print("\nSalary data by job title\n---------------------")
    for x in myresult6:
        print(f"{x[0]} Job Title: {x[1]} salary")
    return

    # Query the EmployeeDependents view that calculates the number of dependents each employees has. [COMPLETE]
def get_dependent_data_by_employee(mycursor):
    sqlquery7_1 = '''SELECT *
                    FROM EmployeeDependents;'''
    # execute the query
    mycursor.execute(sqlquery7_1)

    # get the query result
    myresult7 = mycursor.fetchall()

    print("\nEmployee dependents:\n---------------------")
    # loop through results
    for x in myresult7:
        print(f"{x[0]} {x[1]}:, {x[2]}, {x[3]}, {x[4]} dependents")
    return

    # Query the EmployeeDependents view that calculates the number of dependents each employees has. [COMPLETE]
def get_employee_dependents_specific(mycursor, first_name):
    sqlquery7_2 = '''SELECT *
                    FROM EmployeeDependents
                    WHERE first_name = %s;'''
    mycursor.execute(sqlquery7_2, (first_name,))
    myresult7 = mycursor.fetchall()
    print("\nEmployee dependents:")
    for x in myresult7:
        print(f"{x[0]} {x[1]}:, {x[2]}, {x[3]}, {x[4]} dependents")
    return

    # Query the CountryLocation view to show the number of locations in each country [COMPLETE]
def get_location_data_by_country(mycursor):
    sqlquery8_1 = '''SELECT *
                    FROM CountryLocation;'''
    mycursor.execute(sqlquery8_1)
    myresult8 = mycursor.fetchall()
    print("\nCountry location data\n---------------------")
    for x in myresult8:
        print(f"{x[0]}: {x[1]} locations")
    return

    # Query the CountryLocation view to show country user inputted [COMPLETE]
def get_location_data_by_country_specific(mycursor, country):
    sqlquery8_2 = '''SELECT *
                    FROM CountryLocation
                    WHERE country_name = %s;'''
    mycursor.execute(sqlquery8_2, (country,))
    myresult8 = mycursor.fetchall()
    print("\nCountry location data:")
    for x in myresult8:
        print(f"{x[0]}: {x[1]} locations")
    return

# ------ END OF VIEW DATA QUERY FUNCTIONS ------ #

# ------------ ADD DATA QUERY FUNCTIONS ------------ #
    # Add a new dependent to the database [FAILED]
def add_dependent_data(mycursor,dependent_id, first_name, last_name, relationship):
    sqlquery9 = '''INSERT INTO dependents (dependent_id, first_name, last_name, relationship, employee_id)
                    VALUES (%s, %s, %s, %s, null);'''
    mycursor.execute(sqlquery9, (dependent_id, first_name, last_name, relationship))
    return

    # Add a new job to the database [COMPLETE?]
def add_job_data(mycursor, job_id, job_title, min_salary, max_salary):
    sqlquery10 = '''INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
                    VALUES (%s, %s, %s, %s);'''
    mycursor.execute(sqlquery10, (job_id, job_title, min_salary, max_salary))
    return

# ------------ END OF ADD DATA QUERY FUNCTIONS ------------ #


# ------------ DELETE DATA QUERY FUNCTIONS ------------ #
    # Delete a employee from the database [COMPLETE]
def delete_employee_data(mycursor, employee_id):
    sqlquery11 = '''DELETE FROM employees WHERE employee_id = %s'''
    mycursor.execute(sqlquery11, (employee_id,))
    return

    # Delete a dependent from the database [COMPLETE]
def delete_dependent_data(mycursor, dependent_id):
    sqlquery12 = '''DELETE FROM dependents WHERE dependent_id = %s'''
    mycursor.execute(sqlquery12, (dependent_id,))
    return

# ------------ END OF DELETE DATA QUERY FUNCTIONS ------------ #

# ------------ UPDATE DATA QUERY FUNCTIONS ------------ #

    # Update an employee's first name
def update_employee_first_name_data(mycursor, first_name, employee_id):
    sqlquery13 = '''UPDATE employees SET first_name = %s WHERE employee_id = %s;'''
    mycursor.execute(sqlquery13, (first_name, employee_id))
    return

    # Update an employee's last name
def update_employee_last_name_data(mycursor, employee_id, last_name):
    sqlquery14 = '''UPDATE employees SET last_name = %s WHERE employee_id = %s;'''
    mycursor.execute(sqlquery14, (last_name, employee_id))
    return

    # Update a job's minimum salary
def update_job_min_salary_data(mycursor, job_title, min_salary):
    sqlquery15 = '''UPDATE jobs SET min_salary = %s WHERE job_title = %s;'''
    mycursor.execute(sqlquery15, (min_salary, job_title))
    return

    # Update a job's maximum salary
def update_job_max_salary_data(mycursor, job_title, max_salary):
    sqlquery16 = '''UPDATE jobs SET max_salary = %s WHERE job_title = %s;'''
    mycursor.execute(sqlquery16, (max_salary, job_title))
    return

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
                    region_name = input("Enter region: ")
                    get_employees_data_per_region(mycursor, region_name)
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
                    first_name = input("Enter employee's first name: ")
                    get_employee_dependents_specific(mycursor, first_name)
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
                # ask user for data
                dependent_id = input("Enter dependent id: ")
                first_name = input("Enter first name: ")
                last_name = input("Enter last name: ")
                #employee_id = input("Enter employee id: ")
                relationship = input("Enter relationship: ")
                # employee id is a foreign key, so we need to check if the employee exists
                add_dependent_data(mycursor,dependent_id, first_name, last_name, relationship)
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
                # job id is primary key
                job_id = input("Enter job id: ")
                job_title = input("Enter job title: ")
                min_salary = input("Enter minimum salary: ")
                max_salary = input("Enter maximum salary: ")
                add_job_data(mycursor, job_id, job_title, min_salary, max_salary)
            elif add_job == "N":
                print("Returning to main menu...")
                quit()
            else:
                print("Invalid input. Returning to main menu...")
                quit()
        
        elif user_choice == 11:
            # ask user if they would like to delete an employee
            delete_employee = input("Do you want to delete an employee? (Y/N): ")
            if delete_employee == "Y":
                # ask user for employee id
                employee_id = input("Enter employee id: ")
                delete_employee_data(mycursor, employee_id)
            elif delete_employee == "N":
                print("Returning to main menu...")
                quit()
            else:
                print("Invalid input. Returning to main menu...")
                quit()
        
        elif user_choice == 12:
            # ask user if they would like to delte a dependent
            delete_dependent = input("Do you want to delete a dependent? (Y/N): ")
            if delete_dependent == "Y":
                # ask user for dependent id
                dependent_id = input("Enter dependent id: ")
                delete_dependent_data(mycursor, dependent_id)
            elif delete_dependent == "N":
                print("Returning to main menu...")
                quit()
            else:
                print("Invalid input. Returning to main menu...")
                quit()

        elif user_choice == 13:
            # ask user if they would like to update employee first name
            update_employee_first_name = input("Do you want to update employee first name? (Y/N): ")
            if update_employee_first_name == "Y":
                # ask user for employee id and new first name
                employee_id = input("Enter employee id: ")
                first_name = input("Enter new first name: ")
                update_employee_first_name_data(mycursor, first_name, employee_id)
            elif update_employee_first_name == "N":
                print("Returning to main menu...")
                quit()

        elif user_choice == 14:
            # ask user if they would like to update employee last name
            update_employee_last_name = input("Do you want to update employee last name? (Y/N): ")
            if update_employee_last_name == "Y":
                # ask user for employee id and new last name
                employee_id = input("Enter employee id: ")
                last_name = input("Enter new last name: ")
                update_employee_last_name_data(mycursor, employee_id, last_name)
            elif update_employee_last_name == "N":
                print("Returning to main menu...")
                quit()

        elif user_choice == 15:
            # ask user if they would like to update job's minimum salary
            update_job_min_salary = input("Do you want to update job's minimum salary? (Y/N): ")
            if update_job_min_salary == "Y":
                # ask user for job id and new minimum salary
                job_id = input("Enter job id: ")
                min_salary = input("Enter new minimum salary: ")
                update_job_min_salary_data(mycursor, job_id, min_salary)
            elif update_job_min_salary == "N":
                print("Returning to main menu...")
                quit()

        elif user_choice == 16:
            # ask user if they would like to update job's maximum salary
            update_job_max_salary = input("Do you want to update job's maximum salary? (Y/N): ")
            if update_job_max_salary == "Y":
                # ask user for job id and new maximum salary
                job_id = input("Enter job id: ")
                max_salary = input("Enter new maximum salary: ")
                update_job_max_salary_data(mycursor, job_id, max_salary)
            elif update_job_max_salary == "N":
                print("Returning to main menu...")
                quit()

        elif user_choice == 17:
            #call the function to exit the application
            print("Bye Bye!!!")
            break
        else:
            print("Invalid choice. Please try again.")
main()

# --- END OF MAIN ---