//
//  PokemonRampUpTests.swift
//  PokemonRampUpTests
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import XCTest
@testable import PokemonRampUp

// TO-DO [POKEMON-0011] Create unit test for Pokemon Model
final class PokemonModelTests: XCTestCase {

    // NOTE: This test is to sure the Pokemon Model works as intended. Will come back later in TO-DO [POKEMON-0011] to complete all unit tests for this model
    func testPokemonModelDecodingWithJSONReturnsSuccess() {
        // Given
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "pikachu_response", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // When
        guard let _ = try? decoder.decode(PokemonJSON.self, from: data) else {
            // Then
            XCTFail("JSON file should not fail to decode")
            return
        }
        
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
