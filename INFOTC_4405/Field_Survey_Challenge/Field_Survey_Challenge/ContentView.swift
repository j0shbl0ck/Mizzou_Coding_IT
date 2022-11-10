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

// create the list of observations
struct infoObservation: View {

    var body: some View {
        var fieldData: FieldData? = FieldLoader.load(jsonFileName: "field_observations")
        HStack {
            Image(systemName: "questionmark.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding(.trailing, 20)
            VStack(alignment: .leading) {
                Text("Title")
                    .font(.title)
                Text("Date")
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

// create detailed information of the observation once it is selected
struct ObservationDetail: View {
    let observation: Observation
    
    var body: some View {
        VStack {
            Image(observation.classification.imageName)
                .resizable()
                .scaledToFit()
                .padding()
            Text(observation.title)
                .font(.title)
                .bold()
            Text(observation.description)
                .padding()
            Text("Date: \(dateformatter.string(from: observation.date))")
            Text("Time: \(timeFormatter.string(from: observation.date))")
        }
    }
}

// NavigationView to display the list of observations
struct ContentView: View {
    var body: some View {
        NavigationView {
            List(observations) { observation in
                NavigationLink(destination: ObservationDetail(observation: observation)) {
                    infoObservation()
                }
            }
            .navigationBarTitle("Field Survey")
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
