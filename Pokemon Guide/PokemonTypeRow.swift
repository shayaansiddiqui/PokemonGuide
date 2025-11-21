//
//  PokemonTypeRow.swift
//  Pokemon Guide
//
//  Created by Shayaan Siddiqui on 11/21/25.
//

import SwiftUI

struct PokemonTypeRow: View {
    var pokemonType: PokemonType
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(getCategoryColor(category: pokemonType.type))
                .frame(height: 60)
            HStack {
                Spacer()
                Image(systemName: getCategoryIcon(category: pokemonType.type))
                Text(pokemonType.type)
                    .foregroundColor(.white)
                Spacer()
            }
        }
    }
    
    func getCategoryIcon(category: String) -> String {
        
        switch (category) {
        case "Electric":
            return "bolt.circle"
        case "Fire":
            return "flame.circle"
        case "Grass":
            return "leaf.circle"
        case "Water":
            return "drop.circle"
        default:
            return ""
        }
    }
    
    func getCategoryColor(category: String) -> Color {
        switch (category) {
        case "Electric":
            return Color.yellow
        case "Fire":
            return Color.red
        case "Grass":
            return Color.green
        case "Water":
            return Color.blue
        default:
            return Color.gray
        }
    }
}
