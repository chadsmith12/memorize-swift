//
//  GameBodyView.swift
//  Memorize
//
//  Created by Chad Smith on 6/14/21.
//

import SwiftUI

struct GameBodyView: View {
    @ObservedObject var game: EmojiMemoryGame
    var namespace: Namespace.ID
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: CardConstants.aspectRatio) { card in
            if game.isUndealt(card) || card.isMatched && !card.isFaceUp {
                Color.clear
            }
            else {
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: namespace)
                    .padding(4)
                    .transition(.asymmetric(insertion: .identity, removal: .scale))
                    .zIndex(game.calculateZIndex(for: card))
                    .onTapGesture {
                        withAnimation {
                            game.choose(card)
                        }
                    }
            }
        }
        .foregroundColor(game.themeColor)
    }
}

struct GameBodyView_Previews: PreviewProvider {
    @Namespace static var dealingNamespace
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return ForEach(ColorScheme.allCases, id: \.self) {
            GameBodyView(game: game, namespace: dealingNamespace).preferredColorScheme($0)
        }
    }
}
