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
        .buttonStyle(PokemonButton())
        .padding(.top, 10)
    }


}

class SubmitButtonViewModel {

    // Validates pokemon, guesses, and streak
    func validatePokemon(game: Game) {

        // Handle empty string
        if game.pokemonGuess.isEmpty {
            DispatchQueue.main.async {
                game.guessState = .noGuess
            }
        // Guess Match
        } else if game.pokemonGuess.lowercased() == Pokemon.currentName {
            DispatchQueue.main.async {
                game.guessState = .guessMatch
                game.streakCount += 1
                game.pokemonGuess = ""
            }

        // Guess Mismatch
        } else {
            DispatchQueue.main.async {
                game.guessState = .guessMismatch
                game.resetStreak()
                game.decrementGuesses()
                game.pokemonGuess = ""
            }
        }
    }
}
