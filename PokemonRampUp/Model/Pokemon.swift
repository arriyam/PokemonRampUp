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
    let elementTypes: [ElementType]
    let abilities: [Ability]
    let sprites: Sprites
    let moves: [Move]
    
    enum CodingKeys: String, CodingKey {
        case name
        case elementTypes = "types"
        case abilities
        case sprites
        case moves
    }
}
