//
//  Pokemon.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-10.
//

import Foundation

struct Pokemon {
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

extension Pokemon: Decodable{
    enum CodingKeys: CodingKey {
        case name
        case types
        case abilities
        case sprites
        case moves
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.types = try container.decode([TypeElement].self, forKey: .types)
        self.abilities = try container.decode([Ability].self, forKey: .abilities)
        self.sprites = try container.decode(Sprites.self, forKey: .sprites)
        self.moves = try container.decode([Move].self, forKey: .moves)
    }
}
