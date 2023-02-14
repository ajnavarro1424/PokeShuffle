//
//  Game.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/12/23.
//

import Foundation
import PokemonAPI


class Game: ObservableObject {

    @Published var state: State = .noGuess
    @Published var pokemonGuess: String = ""
    @Published var streakCount: Int = 0
    @Published var remainingGuesses: Int = 3 {
        didSet {
            // End game if no more guesses
            if remainingGuesses == 0 {
                self.state = .gameOver
            }
        }
    }
    @Published var pokemonHistory: [PKMPokemon] = []

    // Context of the game in relation to the guess
    enum State: String {
        case ready
        case guessMatch
        case guessMismatch
        case noGuess
        case gameOver

        var hasGuessed: Bool {
            switch(self) {
                case .guessMatch, .guessMismatch: return true
                default: return false
            }
        }

        var isGameOver: Bool {  self == .gameOver ? true : false }
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


