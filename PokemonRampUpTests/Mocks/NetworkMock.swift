//
//  NetworkMock.swift
//  PokemonRampUpTests
//
//  Created by Thushen Mohanarajah on 2023-03-13.
//

import Foundation
import UIKit
@testable import PokemonRampUp

enum GenericError: Error {
    case genericError
}

struct NetworkMock: Network {
    
    let urlConstants = StringURLConstants()
    
    func loadJSONObject<T: Decodable>(stringURL: String, type: T.Type) async throws -> T {
        
        if (stringURL != urlConstants.vaildImageURL){
            throw GenericError.genericError
        }
        
        let bundle = Bundle.main
        guard let url = bundle.url(forResource: "pichu_response", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                throw GenericError.genericError
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try! decoder.decode(type.self, from: data)
    }
    
    func loadUIImage(urlString: String?) async throws -> UIImage? {
        if (urlString == nil){
            return nil
        }
        
        if (urlString != urlConstants.vaildImageURL){
            throw GenericError.genericError
        }
        return UIImage(named: "ditto")
    }
}
