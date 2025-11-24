//
//  PokemonGridView.swift
//  Pokemon Guide
//
//  Created by Shayaan Siddiqui on 11/22/25.
//

import SwiftUI

struct PokemonGridView: View {
    let columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    var pokemon : PokemonType
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text(pokemon.type)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Spacer()
                }
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(pokemon.pokemonCard) { card in
                        NavigationLink(destination: {
                            PokemonDetailView(pokemon: card)
                        }, label: {
                            Image(card.image) // 👈 Use Image(card.image)
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                .shadow(radius: 3)
                                .padding(.horizontal, 5)
                        })
                        
                    }
                }
            }
        }
    }
}

#Preview {
    PokemonGridView(pokemon: .electricType)
}
