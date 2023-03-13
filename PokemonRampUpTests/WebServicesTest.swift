//
//  WebServicesTest.swift
//  PokemonRampUpTests
//
//  Created by Thushen Mohanarajah on 2023-03-08.
//

import XCTest
@testable import PokemonRampUp

final class WebServicesTest: XCTestCase {

    func testfetchPokemonUIIamgesWhenSuccesfull() {
        
    }
    
    func testPokemonModelDecodingWithJSONReturnsFailure() {
        // Given
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "error_response", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // When
        guard let _ = try? decoder.decode(PokemonJSON.self, from: data) else {
            return
        }
        
        // Then
        XCTFail("JSON file should fail to decode")
    }
}

