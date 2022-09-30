//
//  ContentView.swift
//  GameLeaders
//
//  Created by Josh Block on 9/29/22.
// https://sarunw.com/posts/swiftui-divider/#:~:text=SwiftUI%20Divider%20is%20a%20view%20that%20is%20used,separate%20related%20content%20into%20a%20more%20functional%20group.
// https://daddycoding.com/2020/03/05/swiftui-divider/

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                Text("Game Leaders").font(.subheadline).fontWeight(.bold).padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 250))
            }
            // Passing Yards Section
            VStack{
                Divider()
                    .frame(width: 350)
                Text("Passing Yards").font(.system(size: 14)).bold()
                HStack{
                    HStack(alignment: .top, spacing: 50) {
                        VStack(alignment: .center){
                            Image("H Hooker")
                                .resizable()
                                .frame(width: 35, height: 35, alignment: .center)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1.0))
                            Text("TENN").font(.system(size: 10)).bold().foregroundColor(Color.gray)
                        }
                        VStack(alignment: .trailing){
                            Text("H. Hooker").font(.system(size: 14)).bold()
                            Text("15-19,").font(.system(size: 11)).foregroundColor(Color.gray)
                            Text("255 YDS, 3 TD").font(.system(size: 11)).foregroundColor(Color.gray)
                        }
                    }
                    Divider().frame(height: 50)
                    HStack(alignment: .top, spacing: 50) {
                        VStack(alignment: .leading){
                            Text("C. Bazelak").font(.system(size: 14)).bold()
                            Text("15-19,").font(.system(size: 11)).foregroundColor(Color.gray)
                            Text("255 YDS, 3 TD").font(.system(size: 11)).foregroundColor(Color.gray)
                            Text("2 INT").font(.system(size: 11)).foregroundColor(Color.gray)
                        }
                        VStack(alignment: .center){
                            Image("C Bazelak")
                                .resizable()
                                .frame(width: 35, height: 35, alignment: .center)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1.0))
                            Text("MIZ").font(.system(size: 10)).bold().foregroundColor(Color.gray)
                        }
                    }
                }
            }
            // Rushing Yards Section
            VStack(alignment: .center){
                Divider()
                    .frame(width: 350)
                Text("Rushing Yard").font(.system(size: 14)).bold()
                HStack{
                    HStack(alignment: .top, spacing: 50) {
                        VStack(alignment: .center){
                            Image("T Evans")
                                .resizable()
                                .frame(width: 35, height: 35, alignment: .center)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1.0))
                            Text("TENN").font(.system(size: 10)).bold().foregroundColor(Color.gray)
                        }
                        VStack(alignment: .trailing){
                            Text("T. Evans").font(.system(size: 14)).bold()
                            Text("15 CAR,").font(.system(size: 11)).foregroundColor(Color.gray)
                            Text("156 YDS, 3 TD").font(.system(size: 11)).foregroundColor(Color.gray)
                        }
                    }
                    Divider().frame(height: 50)
                    HStack(alignment: .top, spacing: 50) {
                        VStack(alignment: .leading){
                            Text("T. Badie").font(.system(size: 14)).bold()
                            Text("21 CAR,").font(.system(size: 11)).foregroundColor(Color.gray)
                            Text("41 YDS, 1 TD").font(.system(size: 11)).foregroundColor(Color.gray)
                        }
                        VStack(alignment: .center){
                            Image("T Badie")
                                .resizable()
                                .frame(width: 35, height: 35, alignment: .center)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1.0))
                            Text("MIZ").font(.system(size: 10)).bold().foregroundColor(Color.gray)
                        }
                    }
                }
            }
            // Receiving Yards Section
            VStack{
                Divider()
                    .frame(width: 350)
                Text("Receiving Yards").font(.system(size: 14)).bold()
                HStack{
                    HStack(alignment: .top, spacing: 50) {
                        VStack(alignment: .center){
                            Image("V Jones Jr")
                                .resizable()
                                .frame(width: 35, height: 35, alignment: .center)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1.0))
                            Text("TENN").font(.system(size: 10)).bold().foregroundColor(Color.gray)
                        }
                        VStack(alignment: .trailing){
                            Text("V. Jones Jr.").font(.system(size: 14)).bold()
                            Text("7 REC,").font(.system(size: 11)).foregroundColor(Color.gray)
                            Text("79 YDS, 1 TD").font(.system(size: 11)).foregroundColor(Color.gray)
                        }
                    }
                    Divider().frame(height: 50)
                    HStack(alignment: .top, spacing: 50) {
                        VStack(alignment: .leading){
                            Text("K. Chism").font(.system(size: 14)).bold()
                            Text("4 REC, 76 YDS").font(.system(size: 11)).foregroundColor(Color.gray)

                        }
                        VStack(alignment: .center){
                            Image("K Chism")
                                .resizable()
                                .frame(width: 35, height: 35, alignment: .center)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1.0))
                            Text("MIZ").font(.system(size: 10)).bold().foregroundColor(Color.gray)
                        }
                    }
                }
                Divider()
                    .frame(width: 350)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
