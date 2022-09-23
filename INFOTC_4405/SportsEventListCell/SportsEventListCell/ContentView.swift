//
//  ContentView.swift
//  SportsEventListCell
//
//  Created by Josh Block on 9/21/22.
//
// https://sarunw.com/posts/swiftui-list-basic/
// https://medium.com/swift-productions/create-list-navigation-using-swiftui-c63534355fb1
// https://www.simpleswiftguide.com/how-to-add-navigationview-to-list-in-swiftui-and-show-detail-view-using-navigationlink/
// https://medium.com/swiftui-forum/list-in-swiftui-6778140787ee


import SwiftUI


struct Game: Identifiable {
    var id: Int
    let location, date, sportImage: String
}

struct ContentView: View {
    let games: [Game] = [
        .init(id: 0, location: "Portland at Orlando", date: "Feb 23, 2017 at 10:00 AM", sportImage: "basketball"),
        .init(id: 1, location: "Charlotte at Detroit", date: "Feb 23, 2017 at 10:30 AM", sportImage: "basketball"),
        .init(id: 2, location: "Edmonton at Washington", date: "Feb 23, 2017 at 11:30 AM", sportImage: "soccer"),
        .init(id: 3, location: "Washington at Philadelphia", date: "Feb 23, 2017 at 12:00 PM", sportImage: "soccer"),
        .init(id: 4, location: "Baltimore at Cincinnati", date: "Jan 1, 2018 at 6:30 AM", sportImage: "football"),
        .init(id: 5, location: "Tennesee vs Missouri", date: "Oct 2, 2021 at 11:30 AM", sportImage: "football"),
        .init(id: 6, location: "Houston at Tennessee", date: "Jan 1, 2018 at 8:30 AM", sportImage: "football"),
        .init(id: 7, location: "Nationals vs Dodgers", date: "Oct 11, 2018 at 9:30 AM", sportImage: "baseball"),
        .init(id: 8, location: "Cubs vs Giants", date: "Oct 12, 2018 at 7:30 AM", sportImage: "baseball"),
        .init(id: 9, location: "NY Rangers at Toronto", date: "Feb 23, 2017 at 11:30 AM", sportImage: "hockey"),
        .init(id: 10, location: "Calgary at Tampa Bay", date: "Feb 23, 2017 at 11:30 AM", sportImage: "hockey"),
    ]
}


struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Row 1")
                Text("Row 2")
                // 1
                HStack (spacing: 20) {
                    Image("basketball")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("Row 3")
                    Text("Row Underlying")
                    Spacer()
                }
                HStack {
                    Image(systemName: "3.circle")
                    Text("Row 3")
                    Text("Row Underlying")
                }
                Text("Row 4")
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
