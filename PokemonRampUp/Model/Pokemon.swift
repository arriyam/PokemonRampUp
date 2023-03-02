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
}
