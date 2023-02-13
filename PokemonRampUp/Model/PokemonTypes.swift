//
//  PokemonTypes.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-13.
//

import Foundation

struct PokemonTypes: Decodable {
    let id: Int
    let type: PokemonType
    
    init(id: Int,
         type: PokemonType
    ){
        self.id = id
        self.type = type
    }
}
