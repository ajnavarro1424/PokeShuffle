//
//  Image+Ext.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/13/23.
//

import SwiftUI

extension Image {
    func overlayBlockingColor() -> some View {
        self
            .resizable()
            .renderingMode(.template)
            .foregroundColor(Color.pokemonNavyBlue)
            .aspectRatio(contentMode: .fit)
    }
}
