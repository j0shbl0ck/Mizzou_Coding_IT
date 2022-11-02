//
//  Sports_Events_JSON_and_ListApp.swift
//  Sports_Events_JSON and_List
//
//  Created by Josh Block on 11/2/22.
//
// Source One: https://medium.com/swift-productions/fetch-json-data-display-list-swiftui-2-0-d301f401c223
// Source Two: https://betterprogramming.pub/swift-json-parsing-made-easy-931dc8fee27f
// Source Three: https://www.avanderlee.com/swift/json-parsing-decoding/


import SwiftUI

struct EventData: Decodable {
    enum CodingKeys: String,CodingKey {
        case status
        case events
    }
    var id = UUID()
    let status: String
    var events: [Event]
}

struct Event: Decodable {
    enum CodingKeys: String, CodingKey {
        case sport
        case matchup
        case date
    }
    var id = UUID()
    let sport: String
    let matchup: String
    let date: Date
}


struct Video: Decodable {
    enum CodingKeys: String, CodingKey {
        // Map 'title'  to 'name'
        case name = "title"
        case url
        // Map 'category' to 'topic'
        case topic = "category"
        case views
    }

    // The above mappings can be used now:
    let name: String
    let url: URL
    let topic: String
    let views: Int
}

class EventLoader {
    class func load(jsonFileName: String) -> EventData? {
        var EventData: EventData?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json") {
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
                EventData = try? jsonDecoder.decode(EventData.self, from: jsonData)
            }
            return EventData
        }
    }
    
    
    @main
    struct Sports_Events_JSON_and_ListApp: App {
        let EventData: EventData?
        
        init() {
            EventData = EventLoader.load(jsonFileName: "sports_events")
            if let EventData = EventData {
                print("Status: \(EventData.status)")
                for event in EventData.events {
                    print("id = \(event.id)")
                    print("sport = \(event.sport)")
                    print("matchup = \(event.matchup)")
                    print("date = \(event.date)")
                }
            }
        }
        
        var body: some Scene {
            WindowGroup {
                ContentView()
            }
        }
    }
}
