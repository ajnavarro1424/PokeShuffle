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

        logger.log("getPokemon call with id: \(id)")
        PokemonAPI().pokemonService.fetchPokemon(id) { [weak self] result in
            switch(result) {
            case .success(let pokemon):
                PokemonCache.shared.setCurrentPokemon(pokemon: pokemon)
                self?.logger.log("getPokemon success: \n\(pokemon.name ?? ""), \(pokemon.sprites?.frontDefault ?? "")")
                completion(nil)

            case .failure(let error):
                completion(error)
                self?.logger.log("\(error.localizedDescription)")
            }
        }
    }
}
