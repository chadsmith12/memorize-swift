//
//  Cardify.swift
//  Memorize
//
//  Created by Chad Smith on 6/14/21.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    func body(content: Content) -> some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: DrawingConsts.cornerRadius)
            if rotation < 90 {
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth: DrawingConsts.lineWidth)
            }
            else {
                cardShape.fill()
            }
            content
                .opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(
            Angle.degrees(rotation),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
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
