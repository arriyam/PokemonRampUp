//
//  Sprites.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

struct Sprites {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?

    init(backDefault: String,
         backFemale: String,
         backShiny: String,
         backShinyFemale: String,
         frontDefault: String,
         frontFemale: String,
         frontShiny: String,
         frontShinyFemale: String
    ) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
    }
}

extension Sprites: Decodable {
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backDefault = try container.decodeIfPresent(String.self, forKey: .backDefault)
        self.backFemale = try container.decodeIfPresent(String.self, forKey: .backFemale)
        self.backShiny = try container.decodeIfPresent(String.self, forKey: .backShiny)
        self.backShinyFemale = try container.decodeIfPresent(String.self, forKey: .backShinyFemale)
        self.frontDefault = try container.decodeIfPresent(String.self, forKey: .frontDefault)
        self.frontFemale = try container.decodeIfPresent(String.self, forKey: .frontFemale)
        self.frontShiny = try container.decodeIfPresent(String.self, forKey: .frontShiny)
        self.frontShinyFemale = try container.decodeIfPresent(String.self, forKey: .frontShinyFemale)
    }
}
