//
//  TypeElement.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

// MARK: - TypeElement
struct TypeElement: Decodable {
    let type: TypeElementName
    
    init(type: TypeElementName){
        self.type = type
    }
}

struct TypeElementName: Decodable {
    let name: String
    
    init(name: String){
        self.name = name
    }
}

