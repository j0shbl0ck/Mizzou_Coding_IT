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
                    .font(.headline)
            }
            List{
                HStack {
                    VStack(alignment: .leading) {
                        Text("matchup")
                        Text("football")
                            .font(.headline)
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
