//
//  DataService.swift
//  Pokemon Guide
//
//  Created by Shayaan Siddiqui on 11/21/25.
//

import Foundation

struct DataService {
    func getFileDate() -> [PokemonType] {
        // Get File Path to JSON
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            
            do {
                // Read the file and turn it into Data
                let data = try Data(contentsOf: url)
                // Parse Data into Swift Instances
                let decoder = JSONDecoder()
                let pokemon = try decoder.decode([PokemonType].self, from: data)
                return pokemon;
            } catch {
                print("Error reading file: \(error)")
            }
        }
        return [PokemonType]()
    }
}
