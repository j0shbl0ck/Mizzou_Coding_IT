//
//  ContentView.swift
//  SportsEventInfo
//
//  Created by Josh Block on 9/22/22.
// https://www.simpleswiftguide.com/swiftui-image-tutorial/
// https://swiftontap.com/font/italic()


import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image("football")
                    .padding(.horizontal)
                Text("football")
                .font(Font.system(size: 24))
                
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("Matchup:").italic().font(Font.system(size: 12))
                    Text("Tennessee vs Missouri").font(Font.system(size: 12))
                }
                HStack {
                    Text("When:").italic().font(Font.system(size: 12))
                    Text("October 2, 2021 at 11:30:00 AM").font(Font.system(size: 12))
                }
            }.padding(.leading)
            /*List{
                VStack(alignment: .leading) {
                    HStack {
                        Text("Matchup:").italic().font(.subheadline)
                        Text("Tennessee vs Missouri").font(.subheadline)
                    }
                    HStack {
                        Text("When:").italic().font(.subheadline)
                        Text("October 2, 2021 at 11:30:00 AM").font(.subheadline)
                    }
                }
            }*/
            VStack(alignment: .center){
                Image("TNvsMO_Oct2_2022")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment: .center)
                Image("TNvsMO_GameLeaders")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 275, height: 275, alignment: .center)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
