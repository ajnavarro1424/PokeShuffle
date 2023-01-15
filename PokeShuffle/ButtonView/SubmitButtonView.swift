//
//  SubmitButtonView.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/10/23.
//

import Foundation
import SwiftUI

struct SubmitButtonView: View {

    @Binding var pokemonGuess: String
    @Binding var gameState: GameState

    let viewModel = SubmitButtonViewModel()

    var body: some View {
        Button {
            gameState = viewModel.validatePokemon(against: pokemonGuess)
        } label: {
            Text("Submit")
                .frame(width: 280, height: 50)
                .foregroundColor(Color("pokemonNavyBlue"))
                .background(.white)
                .font(.system(size: 25, weight: .medium, design: .default))
                .cornerRadius(30)
        }


    }
}

class SubmitButtonViewModel {

    func validatePokemon(against guess: String) -> GameState {
        // Handle empty string
        if guess.isEmpty {
            return .emptyGuess
        } else if guess.lowercased() == Pokemon.currentName {
            return  .guessMatch
        } else {
            return .guessMismatch
        }
    }
}
