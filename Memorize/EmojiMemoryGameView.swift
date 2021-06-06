//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Chad Smith on 6/2/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text(game.themeName)
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(game.themeColor)
            HStack {
                Button("New Game") {
                    game.createNewGame()
                }
                Spacer()
                Text("Score: \(game.currentScore)")
            }
            
        }
        .padding(.horizontal)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            EmojiMemoryGameView(game: EmojiMemoryGame()).preferredColorScheme($0)
        }
    }
}
