//
//  ContentView.swift
//  SportsEventListCell
//
//  Created by Josh Block on 9/21/22.
//
// https://sarunw.com/posts/swiftui-list-basic/
// https://medium.com/swift-productions/create-list-navigation-using-swiftui-c63534355fb1
// https://www.simpleswiftguide.com/how-to-add-navigationview-to-list-in-swiftui-and-show-detail-view-using-navigationlink/



import SwiftUI

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
