//
//  PokemonService.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/5/23.
//

import os
import PokemonAPI
import SwiftUI

class PokemonService {

    static let shared = PokemonService()

    let logger = Logger(subsystem: "com.frodude247.PokeShuffle", category: "PokeService")

    func getPokemon(with id: Int, _ completion: @escaping (Error?) -> Void) {
        logger.log("Started getPokemon call with id: \(id)")

        PokemonAPI().pokemonService.fetchPokemon(id) { result in
            switch(result) {
            case .success(let pokemon):
                if let imageURLString = pokemon.sprites?.frontDefault,
                    let imageURL = URL(string: imageURLString),
                    let name = pokemon.name {
                        // Set the values for the Pokemon singleton
                        Pokemon.current.name = name
                        Pokemon.current.imageURL = imageURL

                        completion(nil)
                        self.logger.log("getPokemon success")
                }
            case .failure(let error):
                completion(error)
                self.logger.log("\(error.localizedDescription)")
            }
        }
    }
}
