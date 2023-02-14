//
//  TypeElement.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

// MARK: - TypeElement
struct TypeElement: Decodable {
    let slot: Int
    let type: Species
    
    init(slot: Int,
         type: Species
    ){
        self.slot = slot
        self.type = type
    }
}
