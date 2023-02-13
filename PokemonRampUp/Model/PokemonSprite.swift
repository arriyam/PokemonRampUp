//
//  PokemonSprites.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-13.
//

import Foundation

struct PokemonSprite: Decodable {
    let frontDefault: String
    
    init(frontDefault: String
    ){
        self.frontDefault = frontDefault
    }
}
