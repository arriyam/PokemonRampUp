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
    
    func loadJSONObject<T>(stringURL: String, type: T.Type) async throws -> T where T : Decodable {
        
//        if (urlString == urlConstants.vaildJSONObjectURL){
//            
//        }
//        else{
//            throw GenericError.genericError
//        }
    }
    
    func loadUIImage(urlString: String?) async throws -> UIImage? {
        if (urlString == nil){
            return nil
        }
        
        if (urlString == urlConstants.vaildImageURL){
            return UIImage(named: "ditto")
        }
        else{
            throw GenericError.genericError
        }
    }
}
