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
            Text("Submit")
                .frame(width: 280, height: 50)
                .foregroundColor(Color("pokemonNavyBlue"))
                .background(.white)
                .font(.system(size: 25, weight: .medium, design: .default))
                .cornerRadius(30)
        }
        .disabled(game.isGameOver)
        .onAppear(perform: {
//            viewModel.setup(game)
        })
    }


}

class SubmitButtonViewModel {

//    var game: Game?

    // Validates pokemon, guesses, and streak
    func validatePokemon(game: Game) {
//        guard let game = self.game else {
//            fatalError("Game is nil")
//        }
        // Handle empty string
        if game.pokemonGuess.isEmpty {
            game.guessState = .emptyGuess
        } else if game.pokemonGuess.lowercased() == Pokemon.currentName {
            game.guessState = .guessMatch
            game.streakCount += 1
        } else {
            game.guessState = .guessMismatch
            game.resetStreak()
            game.decrementGuesses()
        }
    }

//    func setup(_ game: Game) {
//        self.game = game
//    }
}
