//
//  Ability.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

// Ability struct represents a Pokemon ability
struct Ability: Decodable & Equatable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case ability
        case name
    }
    
    init(name: String){
        self.name = name
    }
    
    // Custom decoder init block to work with nested JSON objects
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let abilityContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .ability)
        self.name = try abilityContainer.decode(String.self, forKey: .name)
    }
}


