//
//  PokemonImageViewModel.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/5/23.
//

import Foundation
import SwiftUI
import os

class PokemonImageViewModel: ObservableObject {

    @Published var pokemonimageURL: URL?
    @Published private var refresh: Bool = false

    let logger = Logger(subsystem: "com.frodude247.PokeShuffle", category: "PokemonImageViewModel")

    var pokemonName: String?

    func fetchPokemon() {
        PokemonService.shared.getPokemon(with: Int.randomPokemonId) { [weak self] error in
            if let error = error {
                self?.logger.log("\(error.localizedDescription)")
                fatalError("getPokemon network error")
            }
            self?.pokemonName = Pokemon.currentName

            DispatchQueue.main.async {
                self?.pokemonimageURL = Pokemon.currentImageURL
            }
        }
    }

    func refreshModel() {
        self.refresh.toggle()
    }

    func updatePokemonModel(with image: Image) {
        Pokemon.current.image = image
    }
}
