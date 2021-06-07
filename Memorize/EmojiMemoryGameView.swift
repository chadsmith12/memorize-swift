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
            AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
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
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return ForEach(ColorScheme.allCases, id: \.self) {
            EmojiMemoryGameView(game: game).preferredColorScheme($0)
        }
    }
}
