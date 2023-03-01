//
//  Sprites.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

// Sprites struct represents multiple properties that contain URL's that direct to Pokemon images
struct Sprites: Decodable {
    // There are multiple properties to make sure that atleast one of the poperties is vaild(not nil).
    let frontDefaultUrl: String?
    let frontShinyUrl: String?
    let frontOfficialArtworkUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault, frontDreamWorld
        case frontShiny
        case other
        case officialArtwork = "official-artwork"
    }
    
    // Custom decoder init block to work with nested JSON objects
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.frontDefaultUrl = try container.decodeIfPresent(String.self, forKey: .frontDefault)
        self.frontShinyUrl = try container.decodeIfPresent(String.self, forKey: .frontShiny)
        let otherContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .other)
        let dreamWorldContainer = try otherContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .officialArtwork)
        self.frontOfficialArtworkUrl = try dreamWorldContainer.decodeIfPresent(String.self, forKey: .frontDreamWorld)
    }
}
