//
//  Pokemon.swift
//  PokemonDex
//
//  Created by Josh Block on 11/23/22.
//

import Foundation

struct Pokemon : Codable, Identifiable {
    var id: UUID {
        get {
            UUID()
        }
    }
    let num: Int
    let name: String
    let variations : [PokeVariation]
    let link: String
}

struct PokeVariation: Codable {
    let name: String
    let description: String
    let image: String
    let types: [String]
    
    var urlImage: URL {
        get {
            URL(string: "\(baseUrl)/master/public/\(image)")!
        }
    }
}
