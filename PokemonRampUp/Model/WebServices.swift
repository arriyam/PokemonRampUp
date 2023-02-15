//
//  WebServices.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

class WebServices {
    
    let network: Network
    
    init(network: Network = DefaultNetwork()) {
        self.network = network
    }
    
    //Returns a number from 1 to 1008(inclusive). The number is an Id which is used to fetch a random Pokemon from PokeAPI
    func randomIdGenerator() -> Int{
        return Int.random(in: 1..<1009)
    }
    
    func fetchRandomPokemon() async throws -> Pokemon {
        let randomPokemonId = randomIdGenerator()
        let uniquePokemonUrl = "https://pokeapi.co/api/v2/pokemon/\(randomPokemonId)"
        let randomPokemon = try await network.loadJSONObject(stringURL: uniquePokemonUrl, type: Pokemon.self)
        return randomPokemon
    }
    
    func fetchPokemon(pokemonId: Int) async throws -> Pokemon {
        let uniquePokemonUrl = "https://pokeapi.co/api/v2/pokemon/\(pokemonId)"
        let randomPokemon = try await network.loadJSONObject(stringURL: uniquePokemonUrl, type: Pokemon.self)
        return randomPokemon
    }
}
