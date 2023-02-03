//
//  ContentView.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/5/23.
//

import SwiftUI

struct ContentView: View {

    @StateObject var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 15) {
                VStack(spacing: 15) {
                    StreakTextView()
                    Image("pokeball")
                        .resizable()
                        .frame(width: 50, height: 50)
                    RemainingGuessesView()
                }
                HStack {
                    PokemonImageView()
                    GuessStateTextView()
                }
                PokemonLogoTextView()
                GuessTextFieldView()
                    .padding(.top, 10)
                if (game.isGameOver) {
                    RestartButtonView()
                } else {
                    SubmitButtonView()
                    ShuffleButtonView()

                }
                Spacer()
            }
            .environmentObject(game)
            .padding(.top, 10)
        }

        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors: [Color("pokemonRed"), Color("pokemonYellow")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct RemainingGuessesView: View {

    @EnvironmentObject var game: Game

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "questionmark.diamond")
                .resizable()
                .frame(width: 50, height: 50)
                .symbolRenderingMode(.palette)
                .foregroundStyle(Color.pokemonYellow, Color.pokemonNavyBlue)
            StrokeText(text: "\(game.remainingGuesses)",
                       textSize: 35,
                       strokeWidth: 2)
            .animation(.linear, value: game.remainingGuesses)
        }
    }
}

struct StreakTextView: View {

    @EnvironmentObject var game: Game

    var body: some View {

        HStack(spacing: 15) {
            Image(systemName: "star.square")
                .resizable()
                .frame(width: 50, height: 50)
                .symbolRenderingMode(.palette)
                .foregroundStyle(Color.pokemonYellow, Color.pokemonNavyBlue)
            StrokeText(text: "\(game.streakCount)",
                       textSize: 35,
                       strokeWidth: 2)

        }

    }
}

struct PokemonLogoTextView: View {
    var body: some View {
        StrokeText(text: "Pokémon", textSize: 55)
            .foregroundColor(Color.pokemonYellow)
            .font(.system(size: 55, weight: .bold, design: .default))
    }
}


struct GuessStateTextView: View {

    @EnvironmentObject var game: Game

    var gameText: String {
        switch game.guessState {
        case .guessMatch, .guessMismatch:
            return Pokemon.currentName.capitalized
        case .noGuess, .reset:
            return "?"
        }
    }

    var textSize: CGFloat {
        switch(game.guessState) {
        case .guessMatch, .guessMismatch:
            return 25
        case .noGuess, .reset:
            return 100
        }
    }

    var strokeWidth: CGFloat {
        switch(game.guessState) {
        case .guessMatch, .guessMismatch:
            return 1.0
        case .noGuess, .reset:
            return 2.5
        }
    }

    var body: some View {
        StrokeText(text: gameText,
                   textSize: textSize,
                   strokeWidth: strokeWidth,
                   strokeColor: Color.pokemonYellow,
                   foregroundColor: Color.pokemonNavyBlue)
    }

}

struct StrokeText: View {
    let text: String
    let textSize: CGFloat
    let strokeWidth: CGFloat
    let strokeColor: Color
    let foregroundColor: Color

    init(text: String,
         textSize: CGFloat,
         strokeWidth: CGFloat = 2.5,
         strokeColor: Color = Color.pokemonNavyBlue,
         foregroundColor: Color = Color.pokemonYellow) {
        self.text = text
        self.textSize = textSize
        self.strokeWidth = strokeWidth
        self.strokeColor = strokeColor
        self.foregroundColor = foregroundColor
    }

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  strokeWidth, y:  strokeWidth)
                Text(text).offset(x: -strokeWidth, y: -strokeWidth)
                Text(text).offset(x: -strokeWidth, y:  strokeWidth)
                Text(text).offset(x:  strokeWidth, y: -strokeWidth)
            }
            .foregroundColor(strokeColor)
            Text(text)
        }
        .foregroundColor(foregroundColor)
        .font(.system(size: textSize,
                      weight: .bold,
                      design: .default))

    }
}

struct GuessTextFieldView: View {

    @EnvironmentObject var game: Game

    var body: some View  {
        TextField("", text: $game.pokemonGuess)
            .multilineTextAlignment(.center)
            .frame(width: 250, height: 50)
            .background(Color.white)
            .disableAutocorrection(true)
            .tint(Color.pokemonNavyBlue)

    }
}
