//
//  Styles.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/30/23.
//

import Foundation
import SwiftUI

struct PokemonButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 250, height: 50)
            .foregroundColor(Color.pokemonNavyBlue)
            .background(.white)
            .font(.system(size: 25, weight: .medium, design: .default))
            .cornerRadius(30)
    }
}

