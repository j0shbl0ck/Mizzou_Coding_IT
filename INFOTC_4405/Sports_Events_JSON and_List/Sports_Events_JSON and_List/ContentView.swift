//
//  ContentView.swift
//  Sports_Events_JSON and_List
//
//  Created by Josh Block on 11/2/22.
//

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
    
    
    /* class ParseJson {
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
     } */
    
    
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

struct ContentView: View {
    var body: some View {
        var eventData: EventData? = EventLoader.load(jsonFileName: "sports_events")
        
        // build the list with image and text
        List(eventData!.events) { event in
            HStack {
                // for each sport, get sport then get the image
                Image(event.sport)
                    .resizable()
                    .frame(width: 50, height: 50)
            
                VStack(alignment: .leading) {
                    Text(event.sport)
                        .font(.headline)
                    Text(event.matchup)
                        .font(.subheadline)
                    Text(event.date.description)
                        .font(.subheadline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
