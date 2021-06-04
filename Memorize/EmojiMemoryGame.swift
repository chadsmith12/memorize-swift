//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Chad Smith on 6/4/21.
//

import SwiftUI

class EmojiMemoryGame {
    static let vehicleEmojis = ["🚘", "🚙", "🏍", "🛩", "🚐", "🏎", "🚞", "🚉", "🚢", "🚁"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairOfCards: 4) { pairIndex in
            vehicleEmojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
}
