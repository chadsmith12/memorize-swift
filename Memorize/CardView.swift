//
//  CardView.swift
//  Memorize
//
//  Created by Chad Smith on 6/3/21.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    let cardShape = RoundedRectangle(cornerRadius: DrawingConsts.cornerRadius)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    cardShape
                        .fill()
                        .foregroundColor(.white)
                    cardShape
                        .strokeBorder(lineWidth: DrawingConsts.lineWidth)
                    Text(card.content)
                        .font(font(in: geometry.size))
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
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConsts.fontScale)
    }
    
    private struct DrawingConsts {
        static let lineWidth: CGFloat = 3
        static let cornerRadius: CGFloat = 20
        static let fontScale: CGFloat = 0.8
    }
}

struct CardView_Previews: PreviewProvider {
    static let card = MemoryGame<String>.Card(isFaceUp: true, content: "🚀", id: 1)
    static var previews: some View {
        CardView(card: card)
    }
}
