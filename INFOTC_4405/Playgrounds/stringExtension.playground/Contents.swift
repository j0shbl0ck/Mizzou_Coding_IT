// Josh Block
// INFOTC 4405
// 11.07.2022

import UIKit

// create an extension to the String type that adds a new method called "add" that receives an integer and returns an optional string
extension String {
    func add(_ value: Int) -> Int? {
        guard let integer = Int(self) else {
            return nil
        }
        return integer + value
    }
}

// test the new method
let value1: Int? = "5".add(3) // value1 will equal 8
print(value1 as Any)

let value2: Int? = "-2".add(1) // value2 will equal -1
print(value2 as Any)

let value3: Int? = "words".add(4) // value3 will be nil
print(value3 as Any)
