//
//  TypeElement.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

// TypeElement struct represents a Pokemon type
struct ElementType: Decodable, NameContainerProtocol {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case type
        case name
    }
    
    // Custom decoder init block to work with nested JSON objects
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .type)
        self.name = try typeContainer.decode(String.self, forKey: .name)
    }
}



