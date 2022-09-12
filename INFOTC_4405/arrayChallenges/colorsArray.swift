// Josh Block
// INFOTC 4405
// 09.12.2022

// Create an array of colors
var colors:[String] = ["red","orange","yellow","pink"]

// Remove the last item from the colors array using an array method.
colors.removeLast()

// Add "green" to the end of the colors array using an array method.
colors.append("green")

// Create a constant called numColors and set it equal to the number of colors in the array using a property.
let numColors = colors.count

// Print the number of colors in the array.
print("number of colors = \(numColors)")

// Print the string "colors"
print("colors:")

// Iterate through the colors array using a for-in loop and print out each array element.
for color in colors {
    print(color)
}

// Declare a constant called moreColors that is an array that is initialized with the following color names: blue, purple
let moreColors:[String] = ["blue","purple"]

// Declare a variable called allColors and assign it the combined elements of colors and moreColors.
var allColors:[String] = colors + moreColors

// Print the string "allColors"
print("allColors:")

// Iterate through the allColors array using a for-in loop and print out each array element.
for color in allColors {
    print(color)
}


