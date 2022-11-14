//
//  ContentView.swift
//  Field_2
//
//  Created by Josh Block on 11/14/22.
//
// https://www.simpleswiftguide.com/how-to-add-navigationview-to-list-in-swiftui-and-show-detail-view-using-navigationlink/


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

struct FieldRow: View {
    var fieldObservation: FieldObservation

    var body: some View {
        HStack {
            // for each classification, display the title and date
            Image(fieldObservation.classification.rawValue)
                .resizable()
                .frame(width: 25, height: 25)
                .padding()
            VStack(alignment: .leading) {
                Text(fieldObservation.title)
                    .font(.headline)
                // display the date at time in a human readable format
                Text("\(fieldObservation.date, formatter: dateformatter) at \(fieldObservation.date, formatter: timeFormatter)")
                    .font(.subheadline)
            }
        }
    }
}

struct ContentView: View {
    let fieldData = FieldObservationsLoader.load(jsonFileName: "field_observations")
    var body: some View {
        NavigationView {
            List(fieldData!.observations) { fieldObservation in
                NavigationLink(destination: DetailView(fieldObservation: fieldObservation)) {
                    FieldRow(fieldObservation: fieldObservation)
                }
            }
            .navigationBarTitle("Hiking Trails")
        }
    }
}

struct DetailView: View {
    var fieldObservation: FieldObservation

    var body: some View {
        VStack{
            HStack {
                Image(fieldObservation.classification.rawValue)
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text(fieldObservation.title)
                        .font(.headline)
                    Text("\(fieldObservation.date, formatter: dateformatter) at \(fieldObservation.date, formatter: timeFormatter)")
                        .font(.subheadline)
                }
            }
            HStack {
                Text(fieldObservation.description)
                        .font(.subheadline)
            }
            .navigationBarTitle("Observation")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
