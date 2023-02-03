//
//  PokemonImageView.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/6/23.
//

import Foundation
import SwiftUI

struct PokemonImageView: View {

    @EnvironmentObject var game: Game
    @StateObject private var viewModel = PokemonImageViewModel()

    var body: some View {
        if case .guessMatch = game.guessState {
            return AnyView(displayPokemonImage())
        }
        else if case .guessMismatch = game.guessState {
            return AnyView(displayPokemonImage())
        }
        else if case .reset = game.guessState {
            return AnyView(ProgressView()
                .tint(Color.pokemonNavyBlue)
                .frame(width: 200, height: 200)
                .onAppear(perform: {
                    viewModel.refreshModel()
                    game.guessState = .noGuess
                }))
        }
        else {
            return AnyView(AsyncImage(url: viewModel.pokemonimageURL) { phase in
                if let image = phase.image {
                    image.overlayBlockingColor()
                    // Store the Pokemon image in model
                    let _ = DispatchQueue.main.async {
                        viewModel.updatePokemonModel(with: image)
                    }
                } else if phase.error != nil {
                    // Error state
                    Image(systemName: "questionmark")
                        .resizable()
                        .foregroundColor(Color.pokemonBlue)
                        .aspectRatio(contentMode: .fit)
                } else {
                    // Loading state
                    ProgressView()
                        .tint(Color.pokemonBlue)
                }
            }
            .frame(width: 200, height: 200)
            .onAppear(perform: {
                viewModel.fetchPokemon()
                game.guessState = .noGuess
            }))
        }
    }
}

@ViewBuilder
func displayPokemonImage() -> some View {
    Pokemon.currentImage
        .resizable()
        .renderingMode(.original)
        .aspectRatio(contentMode: .fit)
        .frame(width: 200, height: 200)

}
