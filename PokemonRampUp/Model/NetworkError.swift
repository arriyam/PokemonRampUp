//
//  NetworkError.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

enum NetworkError: Error {

    case invalidURL
    case dateParseError
    case requestError
    case invaildImageData
}
