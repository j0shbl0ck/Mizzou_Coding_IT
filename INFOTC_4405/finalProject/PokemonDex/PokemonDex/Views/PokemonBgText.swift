//
//  PokemonBgText.swift
//  PokemonDex
//
//  Created by Josh Block on 11/23/22.
//

import SwiftUI

struct PokemonBgText: View {
    let name: String
    var body: some View {
        Text(name)
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .shadow(radius: 20)
            .padding()
    }
}

struct PokemonBgText_Previews: PreviewProvider {
    static var previews: some View {
        PokemonBgText(name: "Pikachu")
    }
}
