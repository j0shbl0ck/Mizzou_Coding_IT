//
//  ContentView.swift
//  SportsEventInfo
//
//  Created by Josh Block on 9/22/22.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack(spacing: 10){
                Image("football")
                Text("football")
            }
            List{
                HStack {
                    Image("football")
                        .resizable()
                        .frame(width: 35, height: 35, alignment: .center)
                    VStack(alignment: .leading) {
                        Text("football")
                            .font(.headline)
                    }
                }
            }
            Image("TNvsMO_Oct2_2022")
            .resizable()
            .aspectRatio(contentMode: .fit)
            Image("TNvsMO_GameLeaders")
                .resizable()
                .frame(width: 250, height: 250, alignment: .center)
        }
        NavigationView {
            List {
                HStack {
                    Image("football")
                        .resizable()
                        .frame(width: 35, height: 35, alignment: .center)
                    VStack(alignment: .leading) {
                        Text("football")
                            .font(.headline)
                    }
                }

            }.navigationTitle("List")
            
        }
    }
}
struct football: View {
    var body: some View {
        Image("TNvsMO_Oct2_2022")
            .resizable()
            .scaledToFit()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
