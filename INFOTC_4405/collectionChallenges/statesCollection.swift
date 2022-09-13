// Josh Block
// INFOTC 4405
// 09.12.2022

// Declare a variable called states that is declared as a Swift collection type that has elements that have keys 
var states = [String: String]()

// Add Missouri (MO), Pennsylvania (PA), and California (CA) to the collection.
states["PA"] = "Pennsylvania"
states["CA"] = "California"
states["MO"] = "Missouri"

// Using for-in iterate through the key/value pairs of the collection and print them in the format: <key> is <value>
for (key, value) in states {
    print("\(key) is \(value)")
}

// Obtain an array of all of the state abbreviations in the collection and assign it to a constant called stateCodes.
let stateCodes = Array(states.keys)

// Iterate through the array of state abbreviations and print each one.
for stateCode in stateCodes {
    print(stateCode)
}

// Remove Pennsylvania (PA) from the collection using subscript syntax and assigning a nil.
states["PA"] = nil

// Remove Missouri (MO) from the collection using the removeValue(forKey:) method on the collection.
states.removeValue(forKey: "MO")

// Iterate through the key/value pairs of the collection and print them in the format: <key> is <value>
for (key, value) in states {
    print("\(key) is \(value)")
}




