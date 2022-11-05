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

/* class EventLoader {
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
    } */


class ParseJson {
     func readdata() -> [EventData] {
        var dataArray = [EventData]()
        if let bundlePath = Bundle.main.path(forResource: "EventData", ofType: "json") {
            do { 
                if let jsondata = try?Data(contentsOf:  URL(fileURLWithPath: bundlePath))  {
                    if let decodejson = try? JSONDecoder().decode([EventData].self, from: jsondata) {
                        dataArray = decodejson
                    }
                }
            } 
        }
        return dataArray
    }
}
    
    
    @main
    struct Sports_Events_JSON_and_ListApp: App {
        let EventData2 = ParseJson().readdata()
        
        init() {
            EventData2.forEach { (EventData) in
                print(EventData)
            }
        }
        
        var body: some Scene {
            WindowGroup {
                ContentView()
            }
        }
    }
