//
//  Move.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

// MARK: - Move
struct Move: Decodable {
    let move: MoveName
    
    init(move: MoveName) {
        self.move = move
    }
}
