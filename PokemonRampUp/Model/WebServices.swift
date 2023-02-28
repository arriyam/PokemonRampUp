//
//  WebServices.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-17.
//

import Foundation

// TO-DO [POKEMON-0013] Finish unit test for WebServices Model
class WebServices {

    let network: Network
    let pokemonUrl = "https://pokeapi.co/api/v2/pokemon/"

    init(network: Network = DefaultNetwork()) {
        self.network = network
    }

    //Returns a number from 1 to 1008(inclusive). The number is an Id which is used to fetch a random Pokemon from PokeAPI
    private func randomIdGenerator() -> Int {
        return Int.random(in: 1...1008)
    }

    func fetchRandomPokemon() async throws -> Pokemon {
        let uniquePokemonUrl = pokemonUrl + String(randomIdGenerator())
        let randomPokemon = try await network.loadJSONObject(stringURL: uniquePokemonUrl, type: Pokemon.self)
        return randomPokemon
    }

    func fetchPokemon(pokemonId: Int) async throws -> Pokemon {
        let uniquePokemonUrl = pokemonUrl + String(pokemonId)
        let randomPokemon = try await network.loadJSONObject(stringURL: uniquePokemonUrl, type: Pokemon.self)
        return randomPokemon
    }

    func fetchPokemon(pokemonName: String) async throws -> Pokemon {
        let uniquePokemonUrl = pokemonUrl + pokemonName
        let randomPokemon = try await network.loadJSONObject(stringURL: uniquePokemonUrl, type: Pokemon.self)
        return randomPokemon
    }
}
