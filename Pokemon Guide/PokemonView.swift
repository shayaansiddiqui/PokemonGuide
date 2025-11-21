//
//  ContentView.swift
//  Pokemon Guide
//
//  Created by Shayaan Siddiqui on 11/19/25.
//

import SwiftUI

struct PokemonView: View {
    @State var pokemon: [PokemonType] = [PokemonType]()
    var dataService = DataService()
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        Text("Categories")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }
                    ForEach(pokemon) { pokemonType in
                        NavigationLink(destination: {
                            PokemonDetailView(pokemon: pokemonType)
                        }, label: {
                            PokemonTypeRow(pokemonType: pokemonType)
                                .padding(.bottom, 5)
                        })
                        
                    }
                }
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea()
        .onAppear() {
            pokemon = dataService.getFileDate()
        }
    }
}

#Preview {
    PokemonView()
}
