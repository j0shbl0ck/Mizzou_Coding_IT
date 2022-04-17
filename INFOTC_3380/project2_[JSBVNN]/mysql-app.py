#query ClassicModels database - Example
import mysql.connector

def get_mangers(mycursor):
    #create query
    sql_query = "select * from managers;"

    #execute the query
    mycursor.execute(sql_query)

    #get the query result
    query_result = mycursor.fetchall()

    #loop through results
    for record in query_result:
        print(f"Name: {record[1]} {record[2]}\nEmail: {record[3]}\nTitle: {record[4]}\n")
    
    return

def get_order_totals(mycursor):
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    sql_query = "select * from orderTotalsByMonth;" #create query
    mycursor.execute(sql_query)          #execute the query
    query_result = mycursor.fetchall()  #get the query result

    print("\n-----------Order Totals By Month-------------\n")
    for record in query_result:
        print(f"{months[record[1] - 1]} {record[0]}: {record[2]}")

    return

def print_menu():
    print("Choose an option")
    print("1. List all managers")
    print("2. Show order totals by month")
    print("3. Exit Application")
    return

def get_user_choice():
    print_menu()
    choice = int(input("Enter Choice: "))
    return choice


def main():
#create a connector object
    try:
        mydb = mysql.connector.connect(
            host="mysql-container",
            user="root",
            passwd="root",
            database="classicmodels"
        )
        print("Successfully connected to the database!")
    except Exception as err:
        print(f"Error Occured: {err}\nExiting program...")
        quit()

    #create database cursor
    mycursor = mydb.cursor()

    while(True):
        user_choice = get_user_choice()
        if(user_choice == 1):
            #call the function to query the managers
            get_mangers(mycursor)
        elif(user_choice == 2):
            get_order_totals(mycursor)
        elif(user_choice == 3):
            print("Bye Bye!!!")
            break

main()
    

