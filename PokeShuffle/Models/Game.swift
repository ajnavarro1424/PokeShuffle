//
//  Game.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/12/23.
//

import Foundation
import SwiftUI


class Game: ObservableObject {

    @Published var isGameOver: Bool = false
    @Published var guessState: GuessState = .noGuess
    @Published var pokemonGuess: String = ""
    @Published var streakCount: Int = 0
    @Published var remainingGuesses: Int = 3 {
        didSet {
            // End game if no more guesses
            if remainingGuesses == 0 {
                isGameOver.toggle()
            }
        }
    }

    enum GuessState: String {
        case guessMatch
        case guessMismatch
        case emptyGuess
        case noGuess
        case shuffle
    }

    func decrementGuesses() {
        if remainingGuesses > 0 {
            remainingGuesses -= 1
        }
    }

    func resetStreak() {
        streakCount = 0
    }
}


