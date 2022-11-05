//
//  ContentView.swift
//  Sports_Events_JSON and_List
//
//  Created by Josh Block on 11/2/22.
//

import SwiftUI


private var formatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM dd, yy hh:mm a"
    return formatter
}


struct ContentView: View {
    var body: some View {
        var eventData: EventData? = EventLoader.load(jsonFileName: "sports_events")

        // build navigation view
        NavigationView {
            // build the list with image and text
            List(eventData!.events) { event in
                HStack {
                    // for each sport, get sport then get the image
                    Image(event.sport)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding()
                    VStack(alignment: .leading) {
                        Text(event.matchup)
                            .font(.headline)
                        Text("\(event.date, formatter: formatter)")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Sports Events")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
