//
//  Sports_Events_JSON_and_ListApp.swift
//  Sports_Events_JSON and_List
//
//  Created by Josh Block on 11/2/22.
//

import SwiftUI

@main
struct Sports_Events_JSON_and_ListApp: App {
    
    init() {
        if let filepath = Bundle.main.path(forResource: "measurements", ofType: "json") {
            do {
                let contents = try String(contentsOfFile: filepath)
                // the information in the file is in contents
                print(contents)  // to show that it is there
            } catch {
                // contents could not be loaded
            }
        } else {
            // measurements.json is cannot be found
        }
    }
        
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
