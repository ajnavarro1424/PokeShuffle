//
//  ShuffleButtonView.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/12/23.
//

import Foundation
import SwiftUI

struct ShuffleButtonView: View {

    @EnvironmentObject var game: Game

    var body: some View {
        Button {
            game.guessState = .reset
        } label: {
            Image(systemName: "shuffle")
        }
        .buttonStyle(PokemonButton())
        .padding(.top, 10)

    }
}
