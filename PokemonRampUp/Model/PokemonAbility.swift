//
//  PokemonAbility.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-13.
//

import Foundation

struct PokemonAbility: Decodable, Equatable {
    let name: String
    let url: String
    
    init(name: String,
         url: String
    ){
        self.name = name
        self.url = url
    }
}
