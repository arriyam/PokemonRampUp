//
//  PokemonJSON.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-10.
//

import Foundation

// PokemonJSON struct represents a Pokemon object that is decodbale as this is a responce model
struct PokemonJSON: Decodable {
    let name: String
    let elementTypes: [ElementType]
    let abilities: [Ability]
    let moves: [Move]
    let sprites: Sprites
    
    // Created this init block for testing. If this init block is called that will create a pichu pokemon object.
    init (){
        self.name = "pichu"
        self.elementTypes = [ElementType(name: "electric")]
        self.abilities = [Ability(name: "static"), Ability(name: "lightning-rod")]
        self.moves = [Move(name: "double-slap"), Move(name: "mega-punch")]
        self.sprites = Sprites(frontDefaultUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/172.png",
                               frontShinyUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/172.png",
                               frontOfficialArtworkUrl: nil
        )
    }

    enum CodingKeys: String, CodingKey {
        case name
        case elementTypes = "types"
        case abilities
        case moves
        case sprites
    }
}

