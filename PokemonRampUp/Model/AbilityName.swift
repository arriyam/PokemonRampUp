//
//  AbilityName.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-16.
//

import Foundation

struct AbilityName: Decodable {
    let name: String
    
    init(name: String){
        self.name = name
    }
}
