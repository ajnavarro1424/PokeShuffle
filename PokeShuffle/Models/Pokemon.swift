//
//  Pokemon.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/6/23.
//

import Foundation
import PokemonAPI
import SwiftUI

class Pokemon: PKMPokemon {
//    var frontDefaultImage: Image? = nil

}

class PokemonCache {

    static var shared = PokemonCache()

    var pokemon: PKMPokemon?

    var frontDefaultImage: Image?

    var history: [PKMPokemon] = []

    init(pokemon: PKMPokemon? = nil) {
        self.pokemon = pokemon
    }

    func setCurrentPokemon(pokemon: PKMPokemon?) {
        self.pokemon = pokemon
    }

    // MARK: Helper Methods
    static var name: String {
        guard let name = PokemonCache.shared.pokemon?.name else {
            fatalError("Pokemon name nil")
        }
        return name
    }

    static var frontImageURL: URL {
        guard let frontDefault = PokemonCache.shared.pokemon?.sprites?.frontDefault,
                let url = URL(string: frontDefault) else {
            fatalError("Pokemon url nil")
        }
        return url
    }

    static var image: Image {
        guard let image = PokemonCache.shared.frontDefaultImage else {
            fatalError("Pokemon image nil")
        }
        return image
    }

}
