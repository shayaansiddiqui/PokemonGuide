//
//  PokemonExtension.swift
//  Pokemon Guide
//
//  Created by Shayaan Siddiqui on 11/24/25.
//

import Foundation

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
