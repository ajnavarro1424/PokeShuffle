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
            game.guessState = .shuffle
        } label: {
            Text("Shuffle")
                .frame(width: 280, height: 50)
                .foregroundColor(Color("pokemonNavyBlue"))
                .background(.white)
                .font(.system(size: 25, weight: .medium, design: .default))
                .cornerRadius(30)
        }

    }
}


