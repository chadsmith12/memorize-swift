//
//  GameBodyView.swift
//  Memorize
//
//  Created by Chad Smith on 6/14/21.
//

import SwiftUI

struct GameBodyView: View {
    @ObservedObject  var game: EmojiMemoryGame
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Color.clear
            }
            else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)) {
                            game.choose(card)
                        }
                    }
            }
        }
        .foregroundColor(game.themeColor)
    }
}

struct GameBodyView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return ForEach(ColorScheme.allCases, id: \.self) {
            GameBodyView(game: game).preferredColorScheme($0)
        }
    }
}
