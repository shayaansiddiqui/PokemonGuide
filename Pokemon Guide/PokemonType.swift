//
//  PokemonCard.swift
//  Pokemon Guide
//
//  Created by Shayaan Siddiqui on 11/19/25.
//

import Foundation

struct PokemonType:Identifiable, Decodable {
    let id = UUID()
    var type: String
    var pokemonCard: [PokemonCard]
    
    private enum CodingKeys: String, CodingKey {
        case pokemonCard = "pokemon"
        case type
    }
}
