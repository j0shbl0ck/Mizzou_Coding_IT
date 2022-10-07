//
//  ContentView.swift
//  AppleiPhoneChoose
//
//  Created by Josh Block on 10/2/22.
// https://daddycoding.com/2020/03/04/swiftui-rectangle/
// https://sarunw.com/posts/how-to-set-screen-background-color-in-swiftui/
// https://dev.to/fassko/background-color-with-swiftui-1l62
// https://sarunw.com/posts/swiftui-text-font/

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack{
                Text("From $999 or $41.62/mo. before trade-in*")
            }
            // Choose your finish section
            VStack() {
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("Choose your finish.").bold().font(.title2).padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    }
                    // Upper row of finish boxes
                    HStack{
                        // Sierra Blue Box
                        RoundedRectangle(cornerRadius: 4.0)
                        .stroke(Color(.sRGB, red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0))
                        .background(Color.white)
                        .frame(width: 175, height: 80)
                        .overlay(
                            Text("Sierra Blue")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        )
                        // Silver Box
                        RoundedRectangle(cornerRadius: 4.0)
                        .stroke(Color(.sRGB, red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0))
                        .background(Color.white)
                        .frame(width: 175, height: 80)
                        .overlay(
                            Text("Silver")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        )
                    }
                    // Lower row of finish boxes
                    HStack{
                        // Gold Box
                        RoundedRectangle(cornerRadius: 4.0)
                        .stroke(Color(.sRGB, red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0))
                        .background(Color.white)
                        .frame(width: 175, height: 80)
                        .overlay(
                            Text("Gold")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        )
                        // Graphite Box
                        RoundedRectangle(cornerRadius: 4.0)
                        .stroke(Color(.sRGB, red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0))
                        .background(Color.white)
                        .frame(width: 175, height: 80)
                        .overlay(
                            Text("Graphite")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        )
                    }
                }
                    .background(Color(.sRGB, red: 0.953, green: 0.953, blue: 0.969, opacity: 1.0))
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("Choose your capacity.").bold().font(.title2).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                        Text("Your current iPhone X is a 64 GB model").font(.caption).foregroundColor(.gray)
                        Text("How much capacity is right for you?").font(.caption).foregroundColor(.blue)
                    }
                    HStack{
                        RoundedRectangle(cornerRadius: 4.0)
                            .stroke(Color(.sRGB, red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0))
                            .background(Color.white)
                            .frame(width: 175, height: 80)
                        RoundedRectangle(cornerRadius: 4.0)
                            .stroke(Color(.sRGB, red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0))
                            .background(Color.white)
                            .frame(width: 175, height: 80)
                    }
                    HStack{
                        RoundedRectangle(cornerRadius: 4.0)
                            .stroke(Color(.sRGB, red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0))
                            .background(Color.white)
                            .frame(width: 175, height: 80)
                        RoundedRectangle(cornerRadius: 4.0)
                            .stroke(Color(.sRGB, red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0))
                            .background(Color.white)
                            .frame(width: 175, height: 80)
                    }
                }.padding()
                    .background(Color(.sRGB, red: 0.953, green: 0.953, blue: 0.969, opacity: 1.0))
            }.padding().background(Color(.sRGB, red: 0.953, green: 0.953, blue: 0.969, opacity: 1.0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
