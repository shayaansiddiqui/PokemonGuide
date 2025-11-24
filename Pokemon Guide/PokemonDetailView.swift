//
//  PokemonDetailView.swift
//  Pokemon Guide
//
//  Created by Shayaan Siddiqui on 11/21/25.
//

import SwiftUI
import Foundation // Needed for UUID

struct PokemonDetailView: View {
    let columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    var pokemon: PokemonCard
    var body: some View {
        ScrollView {
            VStack {
                PokemonDetailRow(card: pokemon)
            }
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: .chinchou)
}
