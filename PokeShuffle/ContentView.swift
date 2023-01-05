//
//  ContentView.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack() {
                TitleTextView()
                PokeImageView(pokemonImage: "questionmark")
                Button(action: {

                }, label: {
                    ButtonView()
                })
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
        LinearGradient(colors: [Color("pokeYellow"), Color("pokeBlue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct TitleTextView: View {
    var body: some View {
        Text("PokeShuffle")
            .foregroundColor(.white)
            .font(.system(size: 42, weight: .medium, design: .default))
    }
}

struct PokeImageView: View {
    var pokemonImage: String

    var body: some View {
        Image(systemName: pokemonImage)
            .renderingMode(.original)
            .symbolRenderingMode(.monochrome)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .padding(.top, 150)
    }
}

struct ButtonView: View {
    var body: some View {
        Text("Shuffle")
            .frame(width: 280, height: 50)
            .foregroundColor(Color("pokeNavyBlue"))
            .background(.white)
            .font(.system(size: 25, weight: .medium, design: .default))
            .cornerRadius(30)
            .padding(.top, 150)

    }
}
