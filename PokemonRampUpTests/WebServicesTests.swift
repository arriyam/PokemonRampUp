//
//  WebServicesTest.swift
//  PokemonRampUpTests
//
//  Created by Thushen Mohanarajah on 2023-03-17.
//

import Foundation
import XCTest
@testable import PokemonRampUp

final class WebServicesTests: XCTestCase {

    func testfetchRandomPokemonWhenErrorThrown() async {
        // Given
        let mockNetwork = NetworkMock()
        let webServices = WebServices(network: mockNetwork)
        mockNetwork.setloadJSONObjectSuccess(success: false)
        
        // When
        guard let _ = try? await webServices.fetchRandomPokemon() else{
            return
        }
        
        // Then
        XCTFail("fetchRandomPokemon method should not be successful")
    }
    
    func testfetchRandomPokemonWhenSuccessful() async {
        // Given
        let mockNetwork = NetworkMock()
        let webServices = WebServices(network: mockNetwork)
        mockNetwork.setloadJSONObjectSuccess(success: true)
        // If no parameters are inputed into PokemonJSON() than the default pokemon is pichu
        let pichu = PokemonJSON()
        
        // When
        guard let pokemon = try? await webServices.fetchRandomPokemon() else{
            XCTFail("fetchRandomPokemon method should not throw error as there is an network error")
            return
        }
        
        // Then
        XCTAssertEqual(pokemon.name, pichu.name)
        XCTAssertEqual(pokemon.abilities, pichu.abilities)
        XCTAssertEqual(pokemon.elementTypes, pichu.elementTypes)
        XCTAssertEqual(pokemon.moves, pichu.moves)
    }
}
