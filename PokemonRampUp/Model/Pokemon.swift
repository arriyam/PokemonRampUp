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
}
