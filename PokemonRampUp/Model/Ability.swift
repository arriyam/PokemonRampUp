//
//  Ability.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

struct Ability {
    let ability: String
    let isHidden: Bool
    
    init(ability: String,
         isHidden: Bool
    ){
        self.ability = ability
        self.isHidden = isHidden
    }
}

extension Ability: Decodable {
    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let abilityContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .ability)
        self.ability = try abilityContainer.decode(String.self, forKey: .name)
        self.isHidden = try container.decode(Bool.self, forKey: .isHidden)
    }
}


