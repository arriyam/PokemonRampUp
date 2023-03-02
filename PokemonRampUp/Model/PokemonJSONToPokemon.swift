//
//  PokemonJSONToPokemon.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-03-02.
//

import Foundation

// TO-DO [POKEMON-0014] Create unit test for PokemonJSONToPokemon
class PokemonJSONToPokemon{
    
    let pokemonJSON: PokemonJSON
    let images: Images
    
    init(pokemonJSON: PokemonJSON, images: Images) {
        self.pokemonJSON = pokemonJSON
        self.images = images
    }
    
    private func capitalizeFirstLetterOfNameContainers(nameContainers: [NameContainerProtocol]) -> [NameContainerProtocol]{
        var mutableNameContainers = nameContainers
        let length = mutableNameContainers.count - 1
        for i in  0...length {
            mutableNameContainers[i].name = mutableNameContainers[i].name.capitalizingFirstLetter()
        }
        return mutableNameContainers
    }
    
    func convert() -> Pokemon{
        let name = pokemonJSON.name.capitalizingFirstLetter()
        let elementTypes = capitalizeFirstLetterOfNameContainers(nameContainers: pokemonJSON.elementTypes) as! [ElementType]
        let abilities = capitalizeFirstLetterOfNameContainers(nameContainers: pokemonJSON.abilities) as! [Ability]
        let moves = capitalizeFirstLetterOfNameContainers(nameContainers: pokemonJSON.moves) as! [Move]
        return Pokemon(name: name, elementTypes: elementTypes, abilities: abilities, moves: moves, images: self.images)
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
