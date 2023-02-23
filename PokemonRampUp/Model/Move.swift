//
//  Move.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

// Move struct represents a Pokemon move
struct Move: Decodable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case move
        case name
    }
    
    // Custom decoder init block to work with nested JSON objects
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let moveContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .move)
        self.name = try moveContainer.decode(String.self, forKey: .name)
    }
}
