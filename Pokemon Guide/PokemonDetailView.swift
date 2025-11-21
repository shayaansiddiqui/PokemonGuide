//
//  PokemonDetailView.swift
//  Pokemon Guide
//
//  Created by Shayaan Siddiqui on 11/21/25.
//

import SwiftUI
import Foundation // Needed for UUID

// ⚠️ Note: Assuming your struct definitions (PokemonCard, PokemonType)
// are available in this scope or a linked file.
// The UUID() assignment and Int/String types are based on our previous discussion.

// --- Sample Data for Preview ---
extension PokemonCard {
    static let pikachu = PokemonCard(
        //id: UUID(),
        name: "Pikachu",
        about: "When it is angered, it immediately discharges the energy stored in the pouches in its cheeks.",
        hp: 3,
        atk: 4,
        def: 3,
        spatk: 3,
        spdef: 3,
        spd: 6,
        image: "electric-pikachu"
    )
    
    static let chinchou = PokemonCard(
        //id: UUID(),
        name: "Chinchou",
        about: "It lives in ocean depths beyond the reach of sunlight. It flashes lights on its antennae to communicate with others of its kind.",
        hp: 5,
        atk: 3,
        def: 3,
        spatk: 4,
        spdef: 4,
        spd: 4,
        image: "electric-chinchou"
    )
}

extension PokemonType {
    static let electricType = PokemonType(
        //id: UUID(),
        type: "Electric",
        pokemonCard: [
            .pikachu,
            .chinchou // Just using a couple for a concise preview
        ]
    )
}
struct PokemonDetailView: View {
    let columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    var pokemon: PokemonType
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
                        VStack {
                            Image(card.image) // 👈 Use Image(card.image)
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 0, maxWidth: .infinity)
                            // Optional styling for the grid item
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                .shadow(radius: 3)
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: .electricType)
}
