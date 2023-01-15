//
//  ContentView.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/5/23.
//

import SwiftUI

struct ContentView: View {

    @State var pokemonGuess: String = ""
    @State var gameState: GameState = .noGuess

    var body: some View {
        ZStack {
            BackgroundView()
            VStack() {
                Spacer()
                HStack {
                    PokemonImageView(gameState: $gameState)
                    GuessStateTextView(gameState: $gameState)
                }
                PokemonLogoTextView()
                GuessTextFieldView(pokemonGuess: $pokemonGuess)
                    .padding(.top, 10)
                SubmitButtonView(pokemonGuess: $pokemonGuess,
                                 gameState: $gameState)
                    .padding(.top, 10)

                ShuffleButtonView(gameState: $gameState)
                    .padding(.top, 10)
                Spacer()

            }
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

struct PokemonLogoTextView: View {
    var body: some View {
        StrokeText(text: "Pokémon", textSize: 55)
            .foregroundColor(Color.pokemonYellow)
            .font(.system(size: 55, weight: .bold, design: .default))
    }
}


struct GuessStateTextView: View {

    @Binding var gameState: GameState

    var body: some View {
        StrokeText(text: gameState.gameText,
                   textSize: gameState.textSize,
                   strokeWidth: gameState.strokeWidth,
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

    @Binding var pokemonGuess: String

    var body: some View  {
        TextField("Who's that pokemon", text: $pokemonGuess)
            .multilineTextAlignment(.center)
            .frame(width: 280, height: 50)
            .background(Color.white)
            .disableAutocorrection(true)

    }
}
