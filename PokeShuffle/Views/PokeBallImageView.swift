//
//  PokeBallImageView.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 2/3/23.
//

import SwiftUI

struct PokeBallImageView: View {
    var body: some View {
        Image("pokeball")
            .resizable()
            .frame(width: 50, height: 50)
    }
}

struct PokeBallImageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
