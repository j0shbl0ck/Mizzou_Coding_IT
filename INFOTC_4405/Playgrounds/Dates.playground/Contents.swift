import UIKit

// Challenge: Dates
// Josh Block
// 10.15.2022


// 1. Convert a date and time represented in a String to a Date type in Swift. Write the code needed to convert dateString1 to a Date assigned to date1.
let dateString1 = "February 9, 2022 13:22"
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "MMMM d, yyyy HH:mm"
let date1 = dateFormatter.date(from: dateString1)

// 2. Convert a date and time represented in a String to a Date type in Swift. Write the code needed to convert dateString2 to a Date assigned to date2.
let dateString2 = "Mar 03, 21 11:31 am"
dateFormatter.dateFormat = "MMM dd, yy hh:mm a"
let date2 = dateFormatter.date(from: dateString2)

// 3. Get the current date and time as a Date in Swift. Write the code to set currentDate to a Date that represents now.
let currentDate = Date()

// 4. Convert a Date to a String in Swift. Write the code to create a String representing date3 with the format like: 2021-10-29 14:23:02 (typical database datetime format) and assign it to dateString3.
let date3 = Date(timeIntervalSince1970: 564019337)
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
let dateString3 = dateFormatter.string(from: date3)


