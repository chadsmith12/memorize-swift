//
//  GameBottomView.swift
//  Memorize
//
//  Created by Chad Smith on 6/15/21.
//

import SwiftUI

struct GameBottomView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        HStack {
            Button("New Game") {
                withAnimation {
                    game.createNewGame()
                }
            }
            Spacer()
            ShuffleButton(game: game)
            Spacer()
            Text("Score: \(game.currentScore)")
        }
    }
}

struct GameBottomView_Previews: PreviewProvider {
    static let game = EmojiMemoryGame()
    static var previews: some View {
        GameBottomView(game: game)
    }
}
