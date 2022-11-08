// Josh Block
// INFOTC 4405
// 11.07.2022

import UIKit

var greeting = "Hello, playground"



// create an extension that adds a new method called "add" and addes Double String type
extension String {
    func add(_ value: Double) -> Double? {
        guard let double = Double(self) else {
            return nil
        }
        return double + value
    }
}

// test the extension
let value1: Double? = 3.5.add("1.2") // value1 will equal 4.7
let value3: Double? = 1.5.add("words") // value will be nil

