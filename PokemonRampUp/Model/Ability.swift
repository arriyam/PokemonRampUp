//
//  Ability.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

struct Ability: Decodable {
    let ability: NameAndURL
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
    
    init(ability: NameAndURL,
         isHidden: Bool,
         slot: Int
    ){
        self.ability = ability
        self.isHidden = isHidden
        self.slot = slot
    }
}
