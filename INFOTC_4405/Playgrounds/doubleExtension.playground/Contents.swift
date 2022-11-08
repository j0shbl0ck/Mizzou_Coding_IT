// Josh Block
// INFOTC 4405
// 11.07.2022

import UIKit

// create an extension that adds a new method called "add" and adds Double String type
extension Double {
    func add(_ value: String) -> Double? {
        guard let numValue = Double(value) else {
            return nil
        }
        return self + numValue
    }
}

// test the extension
let value1: Double? = 3.5.add("1.2") // value1 will equal 4.7
let value3: Double? = 1.5.add("words") // value will be nil