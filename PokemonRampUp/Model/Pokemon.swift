//
//  Pokemon.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-10.
//

import Foundation

// Pokemon struct represents a Pokemon
struct Pokemon: Decodable {
    let name: String
    let types: [TypeElement]
    let abilities: [Ability]
    let sprites: Sprites
    let moves: [Move]
    
    init(name: String,
         types: [TypeElement],
         abilities: [Ability],
         sprites: Sprites,
         moves: [Move]
    ){
        self.name = name
        self.types = types
        self.abilities = abilities
        self.sprites = sprites
        self.moves = moves
    }
}
