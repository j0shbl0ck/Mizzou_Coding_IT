""" USER INFORMATION 
Student: Josh Block
Date: 4/19/22
Version: 1.0.4 """

# create SQL connection
import mysql.connector


    #Query the EmployeesPerRegion to show the number of employees from the Americas
def get_num_employees_from_Americas(mycursor):
    sqlquery1 = "SELECT * FROM EmployeesPerRegion WHERE Region = 'Americas';"
    mycursor.execute(sqlquery1)
    myresult = mycursor.fetchall()
    print("\nRegion and the number of employees from that region")
    for x in myresult:
        print(x)
    return


    #Query the managers view to show the number of managers in each department
def get_count_of_managers_in_each_department(mycursor):
    sqlquery2 = "SELECT * FROM ManagersByDepartment;"
    mycursor.execute(sqlquery2)
    myresult = mycursor.fetchall()
    print("\nDepartment and the number of managers from that department")
    for x in myresult:
        print(x)
    return

    #Query the DependentsByDepartment view to show the department with the largest number of dependents. This should show the department name and the number of dependents.
def get_department_with_largest_number_of_dependents(mycursor):
    sqlquery3 = "SELECT * FROM DependentsByDepartment;"
    mycursor.execute(sqlquery3)
    myresult = mycursor.fetchall()
    print("\nDepartment and the number of dependents from that department")
    for x in myresult:
        print(x)
    return


    #Query the HiresByYear view to show the number of hires in 1997.
def get_num_hires_in_1997(mycursor):
    sqlquery4 = "SELECT * FROM HiresByYear WHERE Year = 1997;"
    mycursor.execute(sqlquery4)
    myresult = mycursor.fetchall()
    print("\nYear and the number of hires from that year")
    for x in myresult:
        print(x)
    return

    #Query the SalaryByDepartment view to show the total salary for the Finance department.
def get_total_salary_for_finance_department(mycursor):
    sqlquery5 = "SELECT * FROM SalaryByDepartment WHERE Department = 'Finance';"
    mycursor.execute(sqlquery5)
    myresult = mycursor.fetchall()
    print("\nDepartment and the total salaries from that department")
    for x in myresult:
        print(x)
    return

    #Query the SalaryByJobTitle view to show the job title and total salary for the title with the highest total salary.
def get_job_title_with_highest_total_salary(mycursor):
    sqlquery6 = "SELECT * FROM SalaryByJobTitle;"
    mycursor.execute(sqlquery6)
    myresult = mycursor.fetchall()
    print("\nJob Title and the total salaries from that job title")
    for x in myresult:
        print(x)
    return

    #Query the EmployeeDependents view to show employees with no children". Show employee name (first, last), email, phone number, and number of dependents.
def get_employees_with_no_children(mycursor):
    sqlquery7 = "SELECT * FROM EmployeeDependents WHERE Children = 0;"
    mycursor.execute(sqlquery7)
    myresult = mycursor.fetchall()
    print("\nEmployee name, email, phone number, and number of dependents")
    for x in myresult:
        print(x)
    return

    #Query the CountryLocation view to show countries with no locations". Show country name and number of locations.
def get_countries_with_no_locations(mycursor):
    sqlquery8 = "SELECT * FROM CountryLocation WHERE Locations = 0;"
    mycursor.execute(sqlquery8)
    myresult = mycursor.fetchall()
    print("\nCountry and the number of locations from that country")
    for x in myresult:
        print(x)
    return


# ----- MENU -----
def print_menu():
    print("Choose an option")
    print("1. Show the region and the number of employees from that region")
    print("2. Display all the managers")
    print("3. Get a count of how many dependents there are in each department")
    print("4. Calculates the number of employees hired each year")
    print("5. Calculate total salaries for each department")
    print("6. Calculate total salaries for each job title")
    print("7. Calculate the number of dependents each employees has")
    print("8. Calculates the number of locations in each country")
    print("9. Exit Application")
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
            #call the function to show the region and the number of employees from that region
            show_region_and_num_employees(mycursor)
        elif user_choice == 2:
            #call the function to display all the managers
            display_all_managers(mycursor)
        elif user_choice == 3:
            #call the function to get a count of how many dependents there are in each department
            get_count_of_dependents_in_each_department(mycursor)
        elif user_choice == 4:
            #call the function to calculates the number of employees hired each year
            calculate_num_employees_hired_each_year(mycursor)
        elif user_choice == 5:
            #call the function to calculate total salaries for each department
            calculate_total_salaries_for_each_department(mycursor)
        elif user_choice == 6:
            #call the function to calculate total salaries for each job title
            calculate_total_salaries_for_each_job_title(mycursor)
        elif user_choice == 7:
            #call the function to calculate the number of dependents each employees has
            calculate_num_dependents_each_employee_has(mycursor)
        elif user_choice == 8:
            #call the function to calculates the number of locations in each country
            calculate_num_locations_in_each_country(mycursor)
        elif user_choice == 9:
            #call the function to exit the application
            print("Bye Bye!!!")
            break
        else:
            print("Invalid choice. Please try again.")
main()




