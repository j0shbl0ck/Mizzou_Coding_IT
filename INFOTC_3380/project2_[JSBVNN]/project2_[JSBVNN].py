""" USER INFORMATION 
Student: Josh Block
Date: 4/19/22
Version: 1.0.3 """

# create SQL connection
import mysql.connector


def show_region_and_num_employees(mycursor):
    #query to get the region and the number of employees from that region
    sqlquery1 = "SELECT * FROM EmployeesPerRegion;"
    mycursor.execute(sqlquery1)
    #fetch all the rows from the query
    myresult = mycursor.fetchall()
    #print the result
    print("\nRegion and the number of employees from that region")
    for x in myresult:
        print(x)

    return

def display_all_managers(mycursor):
    #query to get the managers
    sqlquery2 = "SELECT * FROM managers;"
    mycursor.execute(sqlquery2)
    #fetch all the rows from the query
    myresult = mycursor.fetchall()
    #print the result
    print("\nManagers")
    for x in myresult:
        print(x)

    return

def get_count_of_dependents_in_each_department(mycursor):
    #query to get the department and the number of dependents from that department
    sqlquery3 = "SELECT * FROM DependentsByDepartment;"
    mycursor.execute(sqlquery3)
    #fetch all the rows from the query
    myresult = mycursor.fetchall()
    #print the result
    print("\nDepartment and the number of dependents from that department")
    for x in myresult:
        print(x)

    return

def calculate_num_employees_hired_each_year(mycursor):
    #query to get the year and the number of employees from that year
    sqlquery4 = "SELECT * FROM HiresByYear;"
    mycursor.execute(sqlquery4)
    #fetch all the rows from the query
    myresult = mycursor.fetchall()
    #print the result
    print("\nYear and the number of employees from that year")
    for x in myresult:
        print(x)
        
    return

def calculate_total_salaries_for_each_department(mycursor):
    #query to get the department and the total salaries from that department
    sqlquery5 = "SELECT * FROM SalaryByDepartment;"
    mycursor.execute(sqlquery5)
    #fetch all the rows from the query
    myresult = mycursor.fetchall()
    #print the result
    print("\nDepartment and the total salaries from that department")
    for x in myresult:
        print(x)

    return

def calculate_total_salaries_for_each_job_title(mycursor):
    #query to get the job title and the total salaries from that job title
    sqlquery6 = "SELECT * FROM SalaryByJobTitle;"
    mycursor.execute(sqlquery6)
    #fetch all the rows from the query
    myresult = mycursor.fetchall()
    #print the result
    print("\nJob Title and the total salaries from that job title")
    for x in myresult:
        print(x)

    return

def calculate_num_dependents_each_employee_has(mycursor):
    #query to get the employee id and the number of dependents from that employee
    sqlquery7 = "SELECT * FROM EmployeeDependents;"
    mycursor.execute(sqlquery7)
    #fetch all the rows from the query
    myresult = mycursor.fetchall()
    #print the result
    print("\nEmployee ID and the number of dependents from that employee")
    for x in myresult:
        print(x)

    return

def calculate_num_locations_in_each_country(mycursor):
    #query to get the country and the number of locations from that country
    sqlquery8 = "SELECT * FROM CountryLocation;"
    mycursor.execute(sqlquery8)
    #fetch all the rows from the query
    myresult = mycursor.fetchall()
    #print the result
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




