//
//  TypeElement.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

struct TypeElement {
    let type: String
    
    init(type: String) {
        self.type = type
    }
}

extension TypeElement: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case type
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .type)
        self.type = try typeContainer.decode(String.self, forKey: .name)
    }
}




