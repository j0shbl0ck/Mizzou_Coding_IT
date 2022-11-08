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

