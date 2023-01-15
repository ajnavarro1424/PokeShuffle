//
//  PokemonImageViewModel.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/5/23.
//

import Foundation
import SwiftUI


@MainActor
class PokemonImageViewModel: ObservableObject {

    @Published var pokemonimageURL: URL?
    @Published private var refresh: Bool = false

    var pokemonName: String?

    func getPokemon() {
        PokemonService.shared.getPokemon(with: Int.randomPokemonId) { error in
            if error != nil {
                fatalError("getPokemon network error")
            }
            self.pokemonName = Pokemon.currentName

            DispatchQueue.main.async {
                self.pokemonimageURL = Pokemon.currentImageURL
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
