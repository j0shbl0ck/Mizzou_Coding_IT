//
//  PokemonList.swift
//  PokemonDex
//
//  Created by Josh Block on 11/23/22.
//

import SwiftUI

struct PokemonList: View {
    
    let pokemons: [Pokemon]
    
    var body: some View {
        List{
            ForEach(pokemons){ poke in
                PokemonCard(poke: poke)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    
            }
        }
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList(pokemons: [])
    }
}
