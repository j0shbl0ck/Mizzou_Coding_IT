//
//  Sports_Events_JSON_and_ListApp.swift
//  Sports_Events_JSON and_List
//
//  Created by Josh Block on 11/2/22.
//
// Source One: https://medium.com/swift-productions/fetch-json-data-display-list-swiftui-2-0-d301f401c223
// Source Two: https://betterprogramming.pub/swift-json-parsing-made-easy-931dc8fee27f
// Source Three: https://www.avanderlee.com/swift/json-parsing-decoding/
// Source Four: https://www.leadbycode.com/2021/08/parse-json-in-swift-from-file-and-url.html
// Source Five: https://blog.learncodeonline.in/navigation-list-view-with-local-json-swiftui
// Source Six: https://www.ioscreator.com/tutorials/swiftui-json-list-tutorial


import SwiftUI

struct EventData: Codable, Identifiable {
    var id = UUID()
    let status: String
    var events: [Event]
    
    enum CodingKeys: String,CodingKey {
        case status
        case events
    }
}

struct Event: Codable, Identifiable {
    var id = UUID()
    let sport: String
    let matchup: String
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case sport
        case matchup
        case date
    }
}

class EventLoader {
    class func load(jsonFileName: String) -> EventData? {
        var eventData: EventData?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
                eventData = try? jsonDecoder.decode(EventData.self, from: jsonData)
        }
        return eventData
    }
}
    
@main
struct Sports_Events_JSON_and_ListApp: App {
    let eventData: EventData?
    
    init() {
        eventData = EventLoader.load(jsonFileName: "sports_events")
        if let eventData = eventData {
            print("Status: \(eventData.status)")
            for event in eventData.events {
                print("id= \(event.id), sport = \(event.sport)")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
