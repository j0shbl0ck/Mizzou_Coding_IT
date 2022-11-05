//
//  ContentView.swift
//  Sports_Events_JSON and_List
//
//  Created by Josh Block on 11/2/22.
//

import SwiftUI

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
