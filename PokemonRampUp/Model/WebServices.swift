//
//  WebServices.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//

import Foundation

class WebServices {
    
    //Returns a number from 1 to 1008(inclusive). The number is an Id which is used to fetch a random Pokemon from PokeAPI
    func randomIdGenerator() -> Int{
        return Int.random(in: 1..<1009)
    }
    
    func fetchRandomPokemon() -> Pokemon?{
        let pokeApiBaseUrlString = "https://pokeapi.co/api/v2/pokemon/"
        let randomPokemonId = randomIdGenerator()
        let uniquePokemonUrl = "https://pokeapi.co/api/v2/pokemon/\(randomPokemonId)"
        
//        let pokemon = DefaultNetwork().loadJSONObject(stringURL: uniquePokemonUrl, type: Pokemon)
        
        return nil
        
    }
    
}