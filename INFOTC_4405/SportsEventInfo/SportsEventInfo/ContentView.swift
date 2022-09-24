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
            Spacer()
            HStack(spacing: 20){
                Image("football")
                    .frame(alignment: .trailing)
                Text("football")
                .font(Font.system(size: 24).italic())            }
            List{
                VStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Matchup:").italic()
                            Text("Tennessee vs Missouri")
                        }
                        HStack {
                            Text("When:").italic()
                            Text("October 2, 2021 at 11:30:00 AM")
                        }
                    }
                }
            }
            VStack(alignment: .center){
                Image("TNvsMO_Oct2_2022")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(alignment: .center)
                Image("TNvsMO_GameLeaders")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250.0, height: 250.0, alignment: .center)
            }

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
