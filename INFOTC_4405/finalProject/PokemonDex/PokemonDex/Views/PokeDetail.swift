//
//  PokeDetail.swift
//  PokemonDex
//
//  Created by Josh Block on 11/23/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokeDetail: View {
    let poke: Pokemon
    var body: some View {
        
        let pokeVar = poke.variations[0]
        
        VStack(spacing: 20){
            WebImage(url: pokeVar.urlImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(pokeVar.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .shadow(radius: 20)
            Text(pokeVar.description)
                .font(.caption)
                .multilineTextAlignment(.center)
                .padding()
            HStack{
                ForEach(pokeVar.types, id: \.self){
                    type in
                    Text(type)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            Link("View more information", destination: URL(string: poke.link)!)
            
            
        }
    }
}

struct PokeDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokeDetail(poke: Pokemon(num: 1, name: "Pikachu", variations: [], link: ""))
    }
}
