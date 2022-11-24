//
//  PokemonCard.swift
//  PokemonDex
//
//  Created by Josh Block on 11/23/22.
//

import SwiftUI
import SDWebImage
import SDWebImageMapKit
import SDWebImageSwiftUI

struct PokemonCard: View {
    let poke: Pokemon
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationLink(destination: PokeDetail(poke: poke)){
                EmptyView()
            }
            WebImage(url: poke.variations[0].urlImage)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .cornerRadius(20)
                .shadow(radius: 20)
            PokemonBgText(name: poke.name)
                .background(.ultraThinMaterial, in:RoundedRectangle(cornerRadius: 10))
                .offset(x:0, y: -40)
        }
    }
}

struct PokemonCard_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCard(poke: Pokemon(num: 1, name: "Pikachu", variations: [], link: ""))
    }
}
