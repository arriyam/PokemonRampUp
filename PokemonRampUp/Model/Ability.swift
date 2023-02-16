//
//  Ability.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

struct Ability: Decodable {
    let ability: AbilityName
    let isHidden: Bool

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
    }
    
    init(ability: AbilityName,
         isHidden: Bool
    ){
        self.ability = ability
        self.isHidden = isHidden
    }
}
