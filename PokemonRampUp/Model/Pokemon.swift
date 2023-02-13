//
//  Pokemon.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-10.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let types: [PokemonTypes]
    let abilities: [PokemonAbility]
    let sprites: PokemonSprite
    let moves: [PokemonMoves]
    
    init(name: String,
         types: [PokemonTypes],
         abilities:[PokemonAbility],
         sprites: PokemonSprite,
         moves: [PokemonMoves]
    ){
        self.name = name
        self.types = types
        self.abilities = abilities
        self.sprites = sprites
        self.moves = moves
    }
    
}
