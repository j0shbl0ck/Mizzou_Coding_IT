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
                    .padding([.leading, .bottom, .trailing])
                Text("football")
                .font(Font.system(size: 24))
                .padding(.bottom)
                
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
