//
//  SubmitButtonView.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/10/23.
//

import Foundation
import SwiftUI

struct SubmitButtonView: View {

    @EnvironmentObject var game: Game

    let viewModel = SubmitButtonViewModel()

    var body: some View {
        Button {
            viewModel.validatePokemon(game: game)
        } label: {
            Image(systemName: "checkmark")
        }
        .disabled(game.state.hasGuessed)
        .buttonStyle(WhiteButton(hasGuessed: game.state.hasGuessed))
    }


}

class SubmitButtonViewModel {

    // Validates pokemon, guesses, and streak
    func validatePokemon(game: Game) {

        // Handle empty string
        if game.pokemonGuess.isEmpty {
            DispatchQueue.main.async {
                game.state = .noGuess
            }
        // Guess Match
        } else if game.pokemonGuess.lowercased() == PokemonCache.name {
            DispatchQueue.main.async {
                game.state = .guessMatch
                game.streakCount += 1
                game.pokemonGuess = ""
            }

        // Guess Mismatch
        } else {
            DispatchQueue.main.async {
                game.state = .guessMismatch
                game.resetStreak()
                game.decrementGuesses()
                game.pokemonGuess = ""
            }
        }
    }
}
