//
//  PokemonType.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-16.
//

import Foundation

struct TypeName: Decodable {
    let name: String
    let url: String
    
    init(name: String,
         url: String
    ){
        self.name = name
        self.url = url
    }
}
