//
//  ShuffleButtonView.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/12/23.
//

import Foundation
import SwiftUI

struct ShuffleButtonView: View {

    @Binding var gameState: GameState

    var body: some View {
        Button {
            self.gameState = .shuffle

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


