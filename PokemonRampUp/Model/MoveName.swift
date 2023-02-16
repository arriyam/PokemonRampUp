//
//  Species.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

struct MoveName: Decodable {
    let name: String
    
    init(name: String){
        self.name = name
    }
}
