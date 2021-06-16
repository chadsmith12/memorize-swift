//
//  CardDeckView.swift
//  Memorize
//
//  Created by Chad Smith on 6/15/21.
//

import SwiftUI

struct CardDeckView: View {
    @ObservedObject var game: EmojiMemoryGame
    var namespace: Namespace.ID
    
    var body: some View {
        ZStack {
            ForEach(game.undealtCards) { card in
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: namespace)
                    .transition(.asymmetric(insertion: .opacity, removal: .identity))
                    .zIndex(game.calculateZIndex(for: card))
            }
        }
        .frame(width: CardConstants.undealtWidth, height: CardConstants.undealtHeight)
        .foregroundColor(game.themeColor)
        .onTapGesture {
            for card in game.cards {
                withAnimation(game.dealAnimation(for: card)) {
                    game.deal(card)
                }
            }
        }
    }
}

struct CardDeckView_Previews: PreviewProvider {
    @Namespace static var previewNamespace
    static var previews: some View {
        let game = EmojiMemoryGame()
        CardDeckView(game: game, namespace: previewNamespace)
    }
}
