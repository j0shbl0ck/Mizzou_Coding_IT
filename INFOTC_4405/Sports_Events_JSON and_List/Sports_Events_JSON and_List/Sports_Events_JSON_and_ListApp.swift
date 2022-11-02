//
//  Sports_Events_JSON_and_ListApp.swift
//  Sports_Events_JSON and_List
//
//  Created by Josh Block on 11/2/22.
//

import SwiftUI

struct Events: Decodable, Identifiable {
    var id = UUID()
    let sport: String
    let matchup: String
    let date: Date
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }
}

class EventLoader {
    class func load(jsonFileName: String) -> EventData? {
        var EventData: EventData?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601

        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json") {
                let jsonData = try? Data(contentsOf: jsonFileUrl) {
                    EventData = try?  jsonDecoder.decode(EventData.self, from: jsonData)
                }
        } 
        return EventData
    }
}


@main
struct Sports_Events_JSON_and_ListApp: App {
    
    let EventData: EventData?

    init() 
        EventData = EventLoader.load(jsonFileName: "sports_events")
        if let EventData = EventData {
            print("Status: \(EventData.status)")
            for event in EventData.events {
                print("Sport: \(event.sport)")
                print("Matchup: \(event.matchup)")
                print("Date: \(event.date)")
            }
        }
    }
        
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
