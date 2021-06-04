//
//  CardView.swift
//  Memorize
//
//  Created by Chad Smith on 6/3/21.
//

import SwiftUI

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    let cardShape = RoundedRectangle(cornerRadius: 40)
    
    var body: some View {
        ZStack {
            if isFaceUp {
                cardShape
                    .fill()
                    .foregroundColor(.white)
                cardShape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            }
            else {
                cardShape
                    .fill()
            }
        }
        .onTapGesture {
            self.isFaceUp.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: "🚀")
    }
}
