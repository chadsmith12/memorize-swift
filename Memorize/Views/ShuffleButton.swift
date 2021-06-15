//
//  ShuffleButton.swift
//  Memorize
//
//  Created by Chad Smith on 6/14/21.
//

import SwiftUI

struct ShuffleButton: View {
    var game: EmojiMemoryGame
    
    var body: some View {
        Button("Shuffle") {
            withAnimation {
                game.shuffle()
            }
        }
    }
}

struct ShuffleButton_Previews: PreviewProvider {
    static let game = EmojiMemoryGame()
    static var previews: some View {
        ShuffleButton(game: game)
    }
}
