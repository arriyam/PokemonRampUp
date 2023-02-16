//
//  Move.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

struct Move {
    let move: String
    
    init(move: String) {
        self.move = move
    }
}

extension Move: Decodable{
    enum CodingKeys: String, CodingKey {
        case move
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let moveContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .move)
        self.move = try moveContainer.decode(String.self, forKey: .name)
    }
}
