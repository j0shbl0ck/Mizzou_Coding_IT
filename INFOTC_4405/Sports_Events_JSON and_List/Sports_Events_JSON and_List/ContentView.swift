//
//  ContentView.swift
//  Sports_Events_JSON and_List
//
//  Created by Josh Block on 11/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
     List(users) { user in
        Text(user.username)
            .font(.headline)
        Text(user.name)
            .font(.subheadline)  
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
