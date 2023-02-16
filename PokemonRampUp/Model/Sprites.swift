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
    let frontDreamWorld: String?

    init(frontDefault: String,
         frontShiny: String,
         frontDreamWorld: String
    ) {
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
        self.frontDreamWorld = frontDreamWorld
    }
}

extension Sprites: Decodable {
    enum CodingKeys: String, CodingKey {
        case frontDefault, frontDreamWorld = "front_default"
        case frontShiny = "front_shiny"
        case other
        case dreamWorld = "dream_world"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.frontDefault = try container.decodeIfPresent(String.self, forKey: .frontDefault)
        self.frontShiny = try container.decodeIfPresent(String.self, forKey: .frontShiny)
        let otherContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .other)
        let dreamWorldContainer = try otherContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .dreamWorld)
        self.frontDreamWorld = try dreamWorldContainer.decodeIfPresent(String.self, forKey: .frontDreamWorld)
    }
}
