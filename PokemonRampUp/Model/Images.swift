//
//  Sprites.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

// Images struct represents a multiple URL's that direct to a Pokemon image
struct Images {
    // Since all properties can be nil there are 3 options to make sure that atleast one of them will have a vaild url to dispaly an image
    let frontDefaultUrl: String?
    let frontShinyUrl: String?
    let frontDreamWorldUrl: String?

    init(frontDefaultUrl: String,
         frontShinyUrl: String,
         frontDreamWorldUrl: String
    ) {
        self.frontDefaultUrl = frontDefaultUrl
        self.frontShinyUrl = frontShinyUrl
        self.frontDreamWorldUrl = frontDreamWorldUrl
    }
}

// Custom decoder init block to work with nested JSON objects 
extension Images: Decodable {
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
