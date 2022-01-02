#Josh Block // INFOTC 1040 F Project // 12.6.20

def get_cost_matrix():
    cost_matrix = [[500, 200, 500, 200, 500] for row in range(10)]
    return cost_matrix

#Convert reservations to flight seating chart
def create_flight_map():
    flight_map = [['O']*5 for row in range(10)]  
    with open('reservations.txt','r') as reservations:
        for line in reservations:
            string = line.split(',')
            r = int(string[1])          
            c = int(string[2])
            flight_map[r][c] = 'X'       
    reservations.close()
    return flight_map       #creates flight map to view across program


#gets the passcode info from the txt file and returns as
#admin to reference for log in
def admin_input():
    admin = {}
    with open('passcodes.txt','r') as passcodes:
        for line in passcodes:
            string = line.split(',')
            admin[string[0].strip()] = string[1].strip()
    return admin


def print_seats(flight_map):
    print('\n\n\nPrinting the Flight Map...\n')
    for r in flight_map:
        print(r)

def total_sales(flight_map,cost_matrix):
    total = 0
    for r in range(10):
        for c in range(5):
            if flight_map[r][c] == 'X':
                total += cost_matrix[r][c]
    return total

#reserves a seat based on user input
def bookSeat(flight_map):
    print('\n\nMake a Reservation')
    print('--------------------\n')
    fname = input('Enter First Name: ')
    lname = input('Enter Last Name: ')
    print_seats(flight_map)
    print()
    booked = False
    r,c = 0,0
    while not booked:
        try:
            while True:
                r = int(input('Which seat row do you want? '))
                c = int(input('Which seat column do you want? '))
                break

            if (flight_map[r-1][c-1]) == 'X':
                print('Row:{0} Seat:{1} is already assigned. Choose again. Choose again.\n'.format(r,c))
                continue
        except ValßueError:
            print('\nCannot understand your input')
            continue
        else:
            print('Your requested seat, Row:{0} Seat:{1} has been assigned'.format(r,c))
            booked = True
            flight_map[r-1][c-1] = 'X'
    print_seats(flight_map)
    print()
    e_ticket = '' #Empty to merge code and fname
    code = 'INFOTC1040'
    for index in range(len(fname)):        #creates the e-ticket name
        e_ticket += fname[index]
        e_ticket += code[index]
    e_ticket += code[len(fname):]
    with open('reservations.txt','a+') as z:  #writes the entered reservation to the txt file
        z.write(fname)
        z.write(', ')
        z.write(str(r-1))
        z.write(', ')
        z.write(str(c-1))
        z.write(', ')
        z.write(e_ticket)
        z.write('\n')
        z.close()
    print('Congratulations {0} {1}! Your trip is now booked! Enjoy!'.format(fname,lname))
    print('Your e-ticket number is: {0}'.format(e_ticket))

#creates a start menu
def option_input():
    print('\n1. Admin Login')
    print('2. Reserve a Seat')
    print('3. Exit')
    while True:
        try:
            option = int(input('\nChoose an option: '))
        except ValueError:
            print('ERROR: Invalid Option! Select 1 or 2 or 3')
            continue
        else:
            return option

#checks login based on txt file
def admin_login(flight_map):
    print('\nAdmin Login')
    print('-------------\n')
    correct_login = admin_input()
    while True:
        username = input('Enter Username: ')
        password = input('Enter Password: ')

        if username not in correct_login.keys():
            print('Invalid username/password combination\n')
        elif correct_login[username] != password:
            print('Invalid username/password combination\n')
        else:
            print_seats(flight_map)
            print('\n\nYour Total Sales: ${0}'.format(total_sales(flight_map,get_cost_matrix())))
            print('You are logged out now!')
            break
        
def main_system():
    print('1040 Airways Reservation System')
    print('-------------------------------')
    option = 0
    flight_map = create_flight_map()
    while option != 3:
        option = option_input()
        if option not in [1,2,3]:
            print('ERROR: Invalid Option! Select 1 or 2 or 3')
        else:
            if option == 1:
                admin_login(flight_map)
            elif option == 2:
                bookSeat(flight_map)
            else:
                print('\nThank you for choosing 1040 Airways! Goodbye :)')

main_system()
    
    
    
    
    
