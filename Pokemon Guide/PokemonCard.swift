//
//  PokemonCard.swift
//  Pokemon Guide
//
//  Created by Shayaan Siddiqui on 11/19/25.
//

import Foundation

struct PokemonCard: Identifiable, Decodable {
    let id = UUID()
    var name: String
    var about: String
    var hp: Int
    var atk: Int
    var def: Int
    var spatk: Int
    var spdef: Int
    var spd: Int
    var image: String
}
