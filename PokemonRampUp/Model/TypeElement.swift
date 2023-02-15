//
//  TypeElement.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

// MARK: - TypeElement
struct TypeElement: Decodable {
    let type: NameAndURL
    
    init(type: NameAndURL){
        self.type = type
    }
}
