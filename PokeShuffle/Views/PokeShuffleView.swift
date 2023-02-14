//
//  PokeShuffleView.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 2/3/23.
//

import SwiftUI

struct PokeShuffleView: View {

    @StateObject var game = Game()

    var body: some View {
        VStack(spacing: 15) {
            PokemonLogoTextView()
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    StreakTextView()
                    PokeBallImageView()
                    RemainingGuessesView()
                }
                HStack {
                    PokemonImageView()
                    GuessStateTextView()
                }
                GuessTextFieldView()
                if (game.state.isGameOver) {
                    RestartButtonView()
                } else {
                    SubmitButtonView()
                    ShuffleButtonView()

                }
            }
            .environmentObject(game)
            .padding(.top, 10)
        }
        .environmentObject(game)
        .padding(.top, 10)

    }
}

struct PokeShuffleView_Previews: PreviewProvider {
    static var previews: some View {
        PokeShuffleView()
    }
}
