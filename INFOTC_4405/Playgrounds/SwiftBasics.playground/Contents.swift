import UIKit

var greeting = "Hello, playground"

// Declare a constant of type unsigned 8 bit integer (UInt8) named sample1 with an initial value of 0x3A
let sample1: UInt8 = 0x3A

// Declare a variable of type unsigned 8 bit integer (UInt8) named sample2 with an initial value of 58
var sample2: UInt8 = 58

// Declare a variable of type Int named heartRate with an initial value of 85
var heartRate: Int = 85

// Declare a variable of type Double named deposits that has an initial value of 135002796
var deposits: Double = 135002796

// Declare a constant Float named acceleration that has an initial value of 9.800
let acceleration: Float = 9.800

// Declare a variable Float named mass that has an initial value of 14.6
var mass: Float = 14.6

// Declare a variable Double named distance that has an initial value of 129.763001
var distance: Double = 129.763001

// Declare a variable Bool named lost that has an initial value of true
var lost: Bool = true

// Declare a variable Bool named expensive that has an initial value of true
var expensive: Bool = true

// Declare a variable Int named choice with an initial value of 2
var choice: Int = 2

// Declare a constant of type Character named integral that has an initial value of \u{222B}
let integral: Character = "\u{222B}"

// Declare a constant of type String named greeting that has an initial value of "Hello"
let greeting2: String = "Hello"

// Declare a variable of type String named name that has an initial value of "Karen"
var name: String = "Karen"

// If sample1 is equal to sample2 then display "The samples are equal." otherwise display "The samples are not equal."
if sample1 == sample2 {
    print("The samples are equal.")
} else {
    print("The samples are not equal.")
}

// If heartRate is greater than equal to 40 and less than equal to 80 then display "Heart rate is normal." otherwise display "Heart rate is not normal."    
if heartRate >= 40 && heartRate <= 80 {
    print("Heart rate is normal.")
} else {
    print("Heart rate is not normal.")
}

// If deposits is greater than or equal to 100000000 then display "You are exceedingly wealthy." otherwise display "Sorry you are so poor."
if deposits >= 100000000 {
    print("You are exceedingly wealthy.")
} else {
    print("Sorry you are so poor.")
}

// Declare a variable Float named force that is assigned the value of mass multiplied by acceleration
var force: Float = mass * acceleration

// Display "force = " followed by the value of force
print("force = \(force)")

// Display the value of distance followed by " is the distance."
print("\(distance) is the distance.")

// Using lost and expensive display "I am really sorry! I will get the manager." if lost and expensive are both true and "Here is coupon for 10% off." if lost is true and expensive is false
if lost == true && expensive == true {
    print("I am really sorry! I will get the manager.")
} else if lost == true && expensive == false {
    print("Here is coupon for 10% off.")
}

// Use switch/case and the variable choice to display "You chose 1." if choice is 1, "You chose 2." if choice is 2, "You chose 3." if choice is 3, and "You made an unknown choice." if choice is something other than 1, 2, or 3
switch choice {
case 1:
    print("You chose 1.")
case 2:
    print("You chose 2.")
case 3:
    print("You chose 3.")
default:
    print("You made an unknown choice.")
}

// Using the Character constant integral, display the character in integral followed by " is an integral."
print("\(integral) is an integral.")

// Using a "for" loop count from 5 to 10 (inclusive of start and end) using an Int variable i. Inside the loop display each value of i with a line that is "i = " followed by the value of i as in:
for i in 5...10 {
    print("i = \(i)")
}

// Declare an Int variable age with an initial value of 0. Using a while loop that continues while age is less than 6 display the value of age in a line that begins with ‘age = ’ and is followed by the value of age. (Example: age = 3) After the age line is displayed increment the value of age by 1.
var age: Int = 0
while age < 6 {
    print("age = \(age)")
    age += 1
}

// Display a line that contains the greeting String followed by name.
print("\(greeting2) \(name)")

