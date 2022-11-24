//
//  ContentView.swift
//  PokemonDex
//
//  Created by Josh Block on 11/23/22.
//
// https://www.youtube.com/watch?v=0_YxopMqTCw
// https://github.com/SDWebImage/SDWebImageSwiftUI
    // https://github.com/SDWebImage/SDWebImageSwiftUI.git
// https://github.com/SDWebImage/SDWebImage
    // https://github.com/SDWebImage/SDWebImage.git

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var pokemonVM : PokemonViewModel = PokemonViewModel()
    
    @State var searchText: String = ""
    
    var body: some View {
        
        NavigationView {
            PokemonList(pokemons: filteredPokemons)
                .task {
                    await pokemonVM.fetchAsyncPokemons()
                }
                .searchable(text: $searchText)
                .navigationTitle("Pokemons")
        }
    }
    
    var filteredPokemons: [Pokemon] {
        if searchText.isEmpty {
            return pokemonVM.pokemons
        }
        return pokemonVM.pokemons.filter{
            $0.name.contains(searchText)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
