//
//  GameState.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/12/23.
//

import Foundation
import SwiftUI


enum GameState: String {
    case guessMatch
    case guessMismatch
    case emptyGuess
    case noGuess
    case shuffle

    var gameText: String {
        switch self {
        case .guessMatch, .guessMismatch:
            return Pokemon.currentName.capitalized
        case .emptyGuess, .noGuess, .shuffle:
            return "?"
        }
    }

    var textForegroundColor: Color {
        switch self {
        case .guessMatch, .guessMismatch:
            return Color("pokemonNavyBlue")
        case .emptyGuess, .noGuess, .shuffle:
            return Color("pokemonYellow")

        }
    }

    var textSize: CGFloat {
        switch(self) {
        case .guessMatch, .guessMismatch:
            return 25
        case .emptyGuess, .noGuess, .shuffle:
            return 100
        }
    }

    var strokeWidth: CGFloat {
        switch(self) {
        case .guessMatch, .guessMismatch:
            return 1.0
        case .emptyGuess, .noGuess, .shuffle:
            return 2.5
        }
    }
}
