//
//  ContentView.swift
//  Field_Survey_Challenge
//
//  Created by Josh Block on 11/10/22.
//

import SwiftUI


// displays date in a human readable format
private var dateformatter: DateFormatter {
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "MMMM dd, yyyy"
    return dateformatter
}

// displays the time in a human readable format
private var timeFormatter: DateFormatter {
    let timeformatter = DateFormatter()
    timeformatter.dateFormat = "h:mm:ss a"
    return timeformatter
}

struct ContentView: View {
    var body: some View {
        var fieldData: FieldData? = FieldLoader.load(jsonFileName: "field_observations")

        // build navigation view
        NavigationView {
            NavigationLink(destination: FieldObservationDetailView()) {
                // build the list with image and text
                List(fieldData!.observations) { observation in
                    HStack {
                        // for each animal, get the classification, title, and date
                        Image(observation.classification)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding()
                        VStack(alignment: .leading) {
                            Text(observation.title)
                                .font(.headline)
                            // display the date at time in a human readable format
                            Text("\(observation.date, formatter: dateformatter) at \(observation.date, formatter: timeFormatter)")
                                .font(.subheadline)
                        }
                    }
                }   
            }
            .navigationBarTitle("Field Survey")
        }
    }
}

struct FieldObservationDetailView: View {
    var body: some View {
        var fieldData: FieldData? = FieldLoader.load(jsonFileName: "field_observations")
        // show selected observation
        HStack{
            Image(fieldData!.observations[0].classification)
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            VStack(alignment: .leading) {
                Text(fieldData!.observations[0].title)
                    .font(.headline)
                Text(fieldData!.observations[0].description)
                    .font(.subheadline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



/* struct ContentView: View {

        var body: some View {

            VStack {
                Image(systemName: "globe")

                    .imageScale(.large)

                    .foregroundColor(.accentColor)

                Text("Hello, world!")

            }
            .padding()

        }
        struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }

    }
} */

