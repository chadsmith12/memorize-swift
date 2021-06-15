//
//  CardView.swift
//  Memorize
//
//  Created by Chad Smith on 6/3/21.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 25))
                    .padding(5)
                    .opacity(0.5)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(.linear(duration: 1).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawingConsts.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConsts.fontSize / DrawingConsts.fontScale)
    }
    
    private struct DrawingConsts {
        static let fontScale: CGFloat = 0.7
        static let fontSize: CGFloat = 32
    }
}

struct CardView_Previews: PreviewProvider {
    static let card = MemoryGame<String>.Card(isFaceUp: true, content: "🚀", id: 1)
    static var previews: some View {
        CardView(card: card)
    }
}
