//
//  PokemonViewModel.swift
//  PokemonDex
//
//  Created by Josh Block on 11/23/22.
//

import Foundation

class PokemonViewModel : ObservableObject {
    @Published var pokemons: [Pokemon] = []
    
    init() {
       //self.fetchPokemons()
    }
    
    func fetchPokemons() {
        ApiService().fetchPokemons { pokemons in
            self.pokemons = pokemons
        }
    }
    
    func fetchAsyncPokemons() async{
        self.pokemons = await ApiService().fetchPokemons()
        }
    }
    
