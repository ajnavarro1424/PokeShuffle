//
//  Styles.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/30/23.
//

import Foundation
import SwiftUI

struct WhiteButton: ButtonStyle {

    let hasGuessed: Bool

    init(hasGuessed: Bool = false) {
        self.hasGuessed = hasGuessed
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 250, height: 50)
            .foregroundColor(Color.pokemonNavyBlue)
            .font(.system(size: 25, weight: .medium, design: .default))
            .background(.white)
            .opacity(hasGuessed ? 0.50 : 100)
            .cornerRadius(30)

    }
}

