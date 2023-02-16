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

    //NOTE: This test is to sure the Pokemon Model works as intended. Will come back later in TO-DO [POKEMON-0011] to complete all unit tests for this model
    func testPokemonModelDecoding() {
        let bundle = Bundle(for: type(of: self))
//        guard let url = bundle.url(forResource: "pikachu_response", withExtension: "json"),
        guard let url = bundle.url(forResource: "pichu_response", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return
        }
        
        let decoder = JSONDecoder()

        guard let pikachu = try? decoder.decode(Pokemon.self, from: data) else {
            print("Failed")
            return
        }
        
//        XCTAssertEqual(pikachu.name, "pikachu")
        XCTAssertEqual(pikachu.name, "pichu")
        print(pikachu.abilities[0].ability)
        print("Successfully converted JSON to Pokemon Model")
    }

}
