//
//  Pokemon.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-28.
//

import Foundation

struct Pokemon {
    let name: String
    let elementTypes: [ElementType]
    let abilities: [Ability]
    let images: Images
    let moves: [Move]
    
    init(pokemonJSON: PokemonJSON, images: Images) {
        self.name = pokemonJSON.name
        self.elementTypes = pokemonJSON.elementTypes
        self.abilities = pokemonJSON.abilities
        self.images = images
        self.moves = pokemonJSON.moves
    }
    
}
