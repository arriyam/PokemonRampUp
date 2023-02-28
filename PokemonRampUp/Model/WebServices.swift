//
//  WebServices.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-17.
//

import Foundation
import UIKit

// TO-DO [POKEMON-0013] Finish unit test for WebServices Model
class WebServices {

    let network: Network
    let pokemonUrl = "https://pokeapi.co/api/v2/pokemon/"

    init(network: Network = DefaultNetwork()) {
        self.network = network
    }

    // Returns a number from 1 to 1008(inclusive). The number is an Id which is used to fetch a random Pokemon from PokeAPI
    private func randomIdGenerator() -> Int {
        return Int.random(in: 1...1008)
    }
    
    private func fetchPokemonUIIamges(pokemonJSON: PokemonJSON) async throws -> Images{
        
        async let frontDefaultImage = try network.loadUIImage(urlString: pokemonJSON.sprites.frontDefaultUrl)
        async let frontShinyImage = try network.loadUIImage(urlString: pokemonJSON.sprites.frontShinyUrl)
        async let frontDreamWorldImage = try network.loadUIImage(urlString: pokemonJSON.sprites.frontDreamWorldUrl)
        
        let images  = await Images(frontDefault: try frontDefaultImage, frontShiny: try frontShinyImage, frontDreamWorld: try frontDreamWorldImage)
//        let images  = Images(frontDefault: nil, frontShiny: nil, frontDreamWorld: nil)
        
        return images
    }

    func fetchRandomPokemon() async throws -> Pokemon {
        let uniquePokemonUrl = pokemonUrl + String(randomIdGenerator())
        let randomPokemonJSON: PokemonJSON = try await network.loadJSONObject(stringURL: uniquePokemonUrl, type: PokemonJSON.self)
        let images = try await fetchPokemonUIIamges(pokemonJSON: randomPokemonJSON)
        let randomPokemon = Pokemon(pokemonJSON: randomPokemonJSON, images: images)
        return randomPokemon
    }

    func fetchPokemon(pokemonId: Int) async throws -> Pokemon {
        let uniquePokemonUrl = pokemonUrl + String(pokemonId)
        let randomPokemonJSON: PokemonJSON = try await network.loadJSONObject(stringURL: uniquePokemonUrl, type: PokemonJSON.self)
        let images = try await fetchPokemonUIIamges(pokemonJSON: randomPokemonJSON)
        let randomPokemon = Pokemon(pokemonJSON: randomPokemonJSON, images: images)
        return randomPokemon
    }

    func fetchPokemon(pokemonName: String) async throws -> Pokemon {
        let uniquePokemonUrl = pokemonUrl + pokemonName
        let pokemonJSON: PokemonJSON = try await network.loadJSONObject(stringURL: uniquePokemonUrl, type: PokemonJSON.self)
        let images = try await fetchPokemonUIIamges(pokemonJSON: pokemonJSON)
        let pokemon = Pokemon(pokemonJSON: pokemonJSON, images: images)
        return pokemon
    }
    
    
}
