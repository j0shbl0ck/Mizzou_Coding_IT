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
        VStack(alignment: .leading, spacing: 10){
            Spacer()
            HStack(){
                Image("football")
                    .frame(alignment: .trailing)
                    .padding()
                Text("football")
                .font(Font.system(size: 24))
                
            }
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
                    .aspectRatio(contentMode: .fill)
                    .frame(alignment: .center)
                Image("TNvsMO_GameLeaders")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250.0, height: 250.0, alignment: .center)
            }
            

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
