//
//  PokemonType.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-16.
//

import Foundation

struct TypeElementName: Decodable {
    let name: String
    
    init(name: String){
        self.name = name
    }
}
