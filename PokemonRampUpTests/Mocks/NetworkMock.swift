//
//  NetworkMock.swift
//  PokemonRampUpTests
//
//  Created by Thushen Mohanarajah on 2023-03-16.
//

import Foundation
import UIKit
@testable import PokemonRampUp

enum GenericError: Error {
    case genericError
}

class NetworkMock: Network {
    private var loadJSONObjectSuccess = true
    private var loadUIImagetSuccess = true
    
    
    func loadJSONObject<T: Decodable & Initializable>(stringURL: String, type: T.Type) async throws -> T {
        if (loadJSONObjectSuccess){
            return T()
        }
        throw GenericError.genericError
    }
    
    func loadUIImage(urlString: String?) async throws -> UIImage? {
        if (loadUIImagetSuccess){
            return UIImage(named: "pichu_image")
        }
        throw GenericError.genericError
    }
    
    func setloadJSONObjectSuccess(success: Bool) {
        self.loadJSONObjectSuccess = success
    }
    
    func setloadUIImagetSuccess(success: Bool) {
        self.loadUIImagetSuccess = success
    }
    
}
