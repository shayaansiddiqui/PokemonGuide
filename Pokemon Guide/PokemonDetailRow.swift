//
//  PokemonDetailRow.swift
//  Pokemon Guide
//
//  Created by Shayaan Siddiqui on 11/21/25.
//

import SwiftUI

struct PokemonDetailRow: View {
    var card: PokemonCard
    
    // Helper function to map property labels to user-friendly names
    private func displayableName(from label: String) -> String? {
        switch label {
        case "hp": return "HP"
        case "atk": return "Attack"
        case "def": return "Defense"
        case "spatk": return "Special Attack"
        case "spdef": return "Special Defense"
        case "spd": return "Speed"
        default: return nil // Ignore non-stat Int properties like 'id' if it was an Int
        }
    }
    
    // Function to get the filtered list of (name, value) tuples
    private func getStats() -> [(String, Int)] {
        let mirror = Mirror(reflecting: card)
        var stats: [(String, Int)] = []
        
        // Iterate over all properties of the PokemonCard
        for child in mirror.children {
            // 1. Check if the value is an Int
            if let value = child.value as? Int,
               let label = child.label,
               // 2. Map the label to its display name and ensure it's a stat we want to show
               let statName = displayableName(from: label) {
                
                stats.append((statName, value))
            }
        }
        return stats
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) { // Use leading alignment for the main VStack
                HStack(alignment: .top) {
                    // Image Section
                    Image(card.image)
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 0, maxWidth: geometry.size.width / 3, minHeight: 150)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .shadow(radius: 3)
                    
                    // Stats List Section
                    VStack(alignment: .leading, spacing: 5) {
                        Text(card.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                        
                        
                        // Use ForEach to iterate over the filtered stats
                        ForEach(getStats(), id: \.0) { statName, statValue in
                            HStack {
                                Text("\(statName):") // Stat Name (e.g., "HP:")
                                    .fontWeight(.medium)
                                Spacer() // Pushes the value to the right
                                Text("\(statValue)") // Stat Value (e.g., "3")
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue) // Optional styling
                            }
                            .padding(.horizontal, 5)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading) // Allow stats column to take available space
                    
                }
                .padding(.bottom, 10)
                
                // About/Description Section
                Text(card.about)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 5)
            }
            .padding() // Padding for the whole content
        }
    }
}

#Preview {
    PokemonDetailRow(card: .pikachu)
}
