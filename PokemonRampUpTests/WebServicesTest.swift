//
//  WebServicesTest.swift
//  PokemonRampUpTests
//
//  Created by Thushen Mohanarajah on 2023-02-15.
//
import XCTest
@testable import PokemonRampUp

// TO-DO [POKEMON-0011] Create unit test for Pokemon Model
final class WebServicesTest: XCTestCase {

    //NOTE: This test is to sure the Pokemon Model works as intended. Will come back later in TO-DO [POKEMON-0011] to complete all unit tests for this model
    func testFetchingPokemon() async {
        do {
            let pokemon = try await WebServices().fetchRandomPokemon()
            print("Pokemon: \(pokemon.name)")
            
        }
        catch(NetworkError.invalidURL){
            print("Failed to grab Pokemon from PokeAPI: invalidURL")
        }
        catch(NetworkError.dateParseError){
            print("Failed to grab Pokemon from PokeAPI: dateParseError")
        }
        catch(NetworkError.requestError){
            print("Failed to grab Pokemon from PokeAPI: requestError")
        }
        catch{
            print("Failed to grab Pokemon from PokeAPI: unknown")
        }
    }

}
