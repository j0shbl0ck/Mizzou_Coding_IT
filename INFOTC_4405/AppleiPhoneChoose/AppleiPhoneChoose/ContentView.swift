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
                            VStack{
                                Circle()
                                .strokeBorder(Color.gray,lineWidth: 0.25)
                                .background(Circle().foregroundColor(Color(.sRGB, red: 0.694, green: 0.776, blue: 0.851, opacity: 1.0)))
                                .frame(width: 20, height: 20)
                                Text("Sierra Blue")
                                .font(.subheadline)
                                .foregroundColor(.black)
                            }
                        )
                        // Silver Box
                        RoundedRectangle(cornerRadius: 4.0)
                        .stroke(Color(.sRGB, red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0))
                        .background(Color.white)
                        .frame(width: 175, height: 80)
                        .overlay(
                            VStack{
                                Circle()
                                .strokeBorder(Color.gray,lineWidth: 0.25)
                                .background(Circle().foregroundColor(Color(.sRGB, red: 0.953, green: 0.957, blue: 0.941, opacity: 1.0)))
                                .frame(width: 20, height: 20)
                                Text("Silver")
                                .font(.subheadline)
                                .foregroundColor(.black)
                            }
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
                            VStack{
                                Circle()
                                .strokeBorder(Color.gray,lineWidth: 0.25)
                                .background(Circle().foregroundColor(Color(.sRGB, red: 0.969, green: 0.925, blue: 0.843, opacity: 1.0)))
                                .frame(width: 20, height: 20)
                                Text("Gold")
                                .font(.subheadline)
                                .foregroundColor(.black)
                            }
                        )
                        // Graphite Box
                        RoundedRectangle(cornerRadius: 4.0)
                        .stroke(Color(.sRGB, red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0))
                        .background(Color.white)
                        .frame(width: 175, height: 80)
                        .overlay(
                            VStack{
                                Circle()
                                .strokeBorder(Color.gray,lineWidth: 0.25)
                                .background(Circle().foregroundColor(Color(.sRGB, red: 0.376, green: 0.365, blue: 0.357, opacity: 1.0)))
                                .frame(width: 20, height: 20)
                                Text("Graphite")
                                .font(.subheadline)
                                .foregroundColor(.black)
                            }
                        )
                    }
                }
                    .background(Color(.sRGB, red: 0.953, green: 0.953, blue: 0.969, opacity: 1.0))
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("Choose your capacity.").bold().font(.title2).padding(EdgeInsets(top: 20, leading: 0, bottom: 1, trailing: 0))
                        Text("Your current iPhone X is a 64 GB model").font(.caption).foregroundColor(.gray)
                        Text("How much capacity is right for you?").font(.caption).foregroundColor(.blue)
                    }
                    // Upper row of capacity boxes
                    HStack{
                        // 128GB Box
                    RoundedRectangle(cornerRadius: 4.0)
                        .stroke(Color(.sRGB, red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0))
                        .background(Color.white)
                        .frame(width: 175, height: 80)
                        .overlay(
                            VStack{
                                Text("128GB")
                                .font(.subheadline)
                                .foregroundColor(.black)
                                + Text("2")
                                .baselineOffset(6.0)
                                .font(.system(size: 7))
                                .foregroundColor(.black)
                                Text("From $999 or $41.62/mo. before trade-in*")
                                .font(.system(size: 9))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                            }
                        )
                        // 256GB Box
                        RoundedRectangle(cornerRadius: 4.0)
                        .stroke(Color(.sRGB, red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0))
                        .background(Color.white)
                        .frame(width: 175, height: 80)
                        .overlay(
                            VStack{
                                Text("256GB")
                                .font(.subheadline)
                                .foregroundColor(.black)
                                + Text("2")
                                .baselineOffset(6.0)
                                .font(.system(size: 7))
                                .foregroundColor(.black)
                                Text("From $1,099 or $45.79/mo. before trade-in*")
                                .font(.system(size: 9))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                            }
                        )
                    }
                    // Lower row of capacity boxes
                    HStack{
                        // 512GB Box
                        RoundedRectangle(cornerRadius: 4.0)
                        .stroke(Color(.sRGB, red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0))
                        .background(Color.white)
                        .frame(width: 175, height: 80)
                        .overlay(
                            VStack{
                                Text("512GB")
                                .font(.subheadline)
                                .foregroundColor(.black)
                                + Text("2")
                                .baselineOffset(6.0)
                                .font(.system(size: 7))
                                .foregroundColor(.black)
                                Text("From $1,299 or $54.12/mo. before trade-in*")
                                .font(.system(size: 9))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                            }
                        )
                        // 1TB Box
                        RoundedRectangle(cornerRadius: 4.0)
                        .stroke(Color(.sRGB, red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0))
                        .background(Color.white)
                        .frame(width: 175, height: 80)
                        .overlay(
                            VStack{
                                Text("1TB")
                                .font(.subheadline)
                                .foregroundColor(.black)
                                + Text("2")
                                .baselineOffset(6.0)
                                .font(.system(size: 7))
                                .foregroundColor(.black)
                                Text("From $1,499 or $62.46/mo. before trade-in*")
                                .font(.system(size: 9))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                            }
                        )
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
