//
//  PokemonImageView.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/6/23.
//

import Foundation
import SwiftUI

struct PokemonImageView: View {

    @Binding var gameState: GameState
    @StateObject private var viewModel = PokemonImageViewModel()

    var body: some View {
        if case .guessMatch = gameState {
            return AnyView(displayPokemonImage())
        }
        else if case .guessMismatch = gameState {
            return AnyView(displayPokemonImage())
        }
        else if case .shuffle = gameState {
            return AnyView(ProgressView()
                .tint(Color.pokemonNavyBlue)
                .frame(width: 200, height: 200)
                .onAppear(perform: {
                    viewModel.refreshModel()
                    gameState = .noGuess
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
                    Image(systemName: "x.square.fill")
                        .resizable()
                        .foregroundColor(.red)
                } else {
                    // Loading state
                    ProgressView()
                        .tint(Color.pokemonBlue)
                }
            }
            .frame(width: 200, height: 200)
            .onAppear(perform: {
                viewModel.getPokemon()
                gameState = .noGuess
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


//@MainActor
//@ViewBuilder
//func displayBlurredPokemonImage(viewModel: PokemonImageViewModel, gameState: GameState) -> some View {
//    AsyncImage(url: viewModel.pokemonimageURL) { phase in
//        if let image = phase.image {
//            image.overlayBlockingColor()
//            let _ = DispatchQueue.main.async {
//                Pokemon.current.image = image
//            }
//        } else if phase.error != nil {
//            // Error state
//            Image(systemName: "x.square.fill")
//        } else {
//            // Loading state
//            ProgressView()
//        }
//    }
//    .frame(width: 200, height: 200)
//    .onAppear(perform: {
//        viewModel.getPokemon()
//        gameState = .noGuess
//
//    })
//}
