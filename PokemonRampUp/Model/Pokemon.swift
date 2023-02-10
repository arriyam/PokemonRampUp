//
//  Pokemon.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-10.
//

import Foundation
import UIKit

struct Pokemon {
    let name: String
    let type: String
    let hiddenAbilites: [String]
    let image: UIImage
    let moves: [String]
    
    //
    // MARK: - Initialization
    //
    init(name: String,
         type: String,
         hiddenAbilites: [String],
         image: UIImage,
         moves: [String]
    ){
        self.name = name
        self.type = type
        self.hiddenAbilites = hiddenAbilites
        self.image = image
        self.moves = moves
    }
    
}
