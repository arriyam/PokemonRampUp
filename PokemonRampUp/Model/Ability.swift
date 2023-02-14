//
//  Ability.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

struct Ability: Decodable {
    let ability: Species
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
    
    init(ability: Species,
         isHidden: Bool,
         slot: Int
    ){
        self.ability = ability
        self.isHidden = isHidden
        self.slot = slot
    }
}
