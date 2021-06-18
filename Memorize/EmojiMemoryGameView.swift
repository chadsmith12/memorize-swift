//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Chad Smith on 6/2/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    @Namespace private var dealingNamespace
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Text(game.themeName)
                    .font(.largeTitle)
                GameBodyView(game: game, namespace: dealingNamespace)
                GameBottomView(game: game)
            }
            CardDeckView(game: game, namespace: dealingNamespace)
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return ForEach(ColorScheme.allCases, id: \.self) {
            EmojiMemoryGameView(game: game).preferredColorScheme($0)
        }
    }
}
