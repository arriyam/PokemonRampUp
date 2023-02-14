//
//  Network.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

// TO-DO [POKEMON-0012] Create unit test for Network model
class Network{
    
    static func loadJSONObject<T: Decodable>(stringURL: String, type: T.Type) async throws -> T{
        guard let url = URL(string: stringURL) else {
            throw NetworkError.invalidURL
        }
        
        guard let (data, _) = try? await URLSession.shared.data(from: url) else{
            throw NetworkError.requestError
        }
        
        let decoder = JSONDecoder()
        guard let objectT = try? decoder.decode(T.self, from: data) else {
            throw NetworkError.dateParseError
        }
        
        return objectT
    }
}
