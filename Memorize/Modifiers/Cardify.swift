//
//  Cardify.swift
//  Memorize
//
//  Created by Chad Smith on 6/14/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: DrawingConsts.cornerRadius)
            if isFaceUp {
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth: DrawingConsts.lineWidth)
            }
            else {
                cardShape.fill()
            }
            content
                .opacity(isFaceUp ? 1 : 0)
        }
    }
    
    private struct DrawingConsts {
        static let lineWidth: CGFloat = 3
        static let cornerRadius: CGFloat = 20
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
