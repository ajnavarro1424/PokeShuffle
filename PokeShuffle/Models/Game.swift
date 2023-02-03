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
                isGameOver = true
            }
        }
    }

    // Context of the game in relation to the guess
    enum GuessState: String {
        case guessMatch
        case guessMismatch
        case noGuess
        case reset

        var hasGuessed: Bool {
            switch(self) {
                case .guessMatch, .guessMismatch: return true
                default: return false
            }
        }
    }

    func decrementGuesses() {
        if remainingGuesses > 0 {
            remainingGuesses -= 1
        }
    }

    func resetGuesses() {
        remainingGuesses = 3
    }

    func resetStreak() {
        streakCount = 0
    }
}


