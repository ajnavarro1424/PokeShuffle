//
//  RestartButtonView.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/30/23.
//

import Foundation
import SwiftUI

struct RestartButtonView: View {

    @EnvironmentObject var game: Game

    var body: some View {
        Button {
            DispatchQueue.main.async {
                game.guessState = .reset
                game.isGameOver = false
                game.resetGuesses()
            }
        } label: {
            Image(systemName: "gobackward")
        }
        .buttonStyle(PokemonButton())
        .padding(.top, 10)

    }
}
