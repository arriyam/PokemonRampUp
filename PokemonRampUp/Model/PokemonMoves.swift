//
//  PokemonMoves.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-13.
//

import Foundation

struct PokemonMoves: Decodable {
    let move: PokemonMove
    
    init(move: PokemonMove
    ){
        self.move = move
    }
}
