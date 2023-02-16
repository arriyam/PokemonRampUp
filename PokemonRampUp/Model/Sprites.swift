//
//  Sprites.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

struct Sprites {
    let frontDefault: String?
    let frontShiny: String?

    init(frontDefault: String,
         frontShiny: String
    ) {
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
    }
}

extension Sprites: Decodable {
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.frontDefault = try container.decodeIfPresent(String.self, forKey: .frontDefault)
        self.frontShiny = try container.decodeIfPresent(String.self, forKey: .frontShiny)
    }
}
