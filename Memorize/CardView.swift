//
//  CardView.swift
//  Memorize
//
//  Created by Chad Smith on 6/3/21.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    let cardShape = RoundedRectangle(cornerRadius: 20)
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                cardShape
                    .fill()
                    .foregroundColor(.white)
                cardShape
                    .strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                cardShape
                    .opacity(0)
            }
            else {
                cardShape
                    .fill()
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static let card = MemoryGame<String>.Card(content: "🚀", id: 1)
    static var previews: some View {
        CardView(card: card)
    }
}
