//
//  Species.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

// This is a generic struct that has a name and URL variable. This is generic as there is many cases where this object is found when requesting Pokemon JSON from PokeAPI
struct NameAndURL: Decodable {
    let name: String
    let url: String
    
    init(name: String,
         url: String
    ){
        self.name = name
        self.url = url
    }
}


