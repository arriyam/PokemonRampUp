//
//  PokemonMoves.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-13.
//

import Foundation

struct Species: Decodable {
    let move: PokemonMove
    
    init(move: PokemonMove
    ){
        self.move = move
    }
}
