//
//  PokemonTypes.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-13.
//

import Foundation

struct PokemonType: Decodable {
    let name: String
    let url: String
    
    init(name: String,
         url: String
    ){
        self.name = name
        self.url = url
    }
}
