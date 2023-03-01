//
//  Pokemon.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-28.
//

import Foundation

// Pokemon struct represents a Pokemon object for the presenation layer
struct Pokemon {
    let name: String
    let elementTypes: [ElementType]
    let abilities: [Ability]
    let moves: [Move]
    let images: Images
    
    init(pokemonJSON: PokemonJSON, images: Images) {
        self.name = pokemonJSON.name
        self.elementTypes = pokemonJSON.elementTypes
        self.abilities = pokemonJSON.abilities
        self.moves = pokemonJSON.moves
        self.images = images
    }
    
}
