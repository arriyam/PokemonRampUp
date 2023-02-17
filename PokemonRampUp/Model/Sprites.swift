//
//  Sprites.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

// Sprites struct represents multiple properties that contain URL's that direct to Pokemon images
struct Sprites {
    // There are multiple properties to make sure that atleast one of the poperties is vaild(not nil).
    let frontDefaultUrl: String?
    let frontShinyUrl: String?
    let frontDreamWorldUrl: String?
}

// Custom decoder init block to work with nested JSON objects 
extension Sprites: Decodable {
    enum CodingKeys: String, CodingKey {
        case frontDefaultUrl, frontDreamWorldUrl = "front_default"
        case frontShinyUrl = "front_shiny"
        case other
        case dreamWorld = "dream_world"
    }
    

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.frontDefaultUrl = try container.decodeIfPresent(String.self, forKey: .frontDefaultUrl)
        self.frontShinyUrl = try container.decodeIfPresent(String.self, forKey: .frontShinyUrl)
        let otherContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .other)
        let dreamWorldContainer = try otherContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .dreamWorld)
        self.frontDreamWorldUrl = try dreamWorldContainer.decodeIfPresent(String.self, forKey: .frontDreamWorldUrl)
    }
}
