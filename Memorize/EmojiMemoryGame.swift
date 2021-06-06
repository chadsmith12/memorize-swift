//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Chad Smith on 6/4/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let vehicleEmojis = ["🚘", "🚙", "🏍", "🛩", "🚐", "🏎", "🚞", "🚉", "🚢", "🚁"]
    static let flagEmojis = ["🇺🇸", "🏳️‍🌈", "🇸🇦", "🇨🇳", "🏴‍☠️", "🇮🇶", "🏁", "🇻🇪", "🇻🇳",  "🇹🇭", "🇬🇧", "🇫🇲", "🇨🇴", "🇹🇷", "🇺🇦", "🇧🇼"]
    
    static let themes = createThemes()
    
    static func createMemoryGame(numberPairOfCards: Int, theme: Theme<String>) -> MemoryGame<String> {
        let shuffledContent = theme.emojiContent.shuffled()
        return MemoryGame(numberOfPairOfCards: numberPairOfCards) { pairIndex in
            shuffledContent[pairIndex]
        }
    }
    
    static func createThemes() -> [Theme<String>] {
        [
            Theme<String>(name: "Vehicles", emojiContent: vehicleEmojis, color: "blue", numberOfPairs: 4),
            Theme<String>(name: "Flags", emojiContent: flagEmojis, color: "green", numberOfPairs: 8)
        ]
    }
    
    init() {
        let randomThemeIndex = Int.random(in: 0 ..< EmojiMemoryGame.themes.count)
        let theme = EmojiMemoryGame.themes[randomThemeIndex]
        currentTheme = theme
        model = EmojiMemoryGame.createMemoryGame(numberPairOfCards: theme.numberOfPairs, theme: theme)
    }
    
    @Published private var model: MemoryGame<String>
    @Published private var currentTheme: Theme<String>
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    var themeColor: Color {
        switch currentTheme.color {
        case "red":
            return Color.red
        case "blue":
            return Color.blue
        case "green":
            return Color.green
        default:
            return Color.orange
        }
    }
    
    var themeName: String {
        currentTheme.name
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func createNewGame() {
        let randomThemeIndex = Int.random(in: 0 ..< EmojiMemoryGame.themes.count)
        let theme = EmojiMemoryGame.themes[randomThemeIndex]
        currentTheme = theme
        model = EmojiMemoryGame.createMemoryGame(numberPairOfCards: theme.numberOfPairs, theme: theme)
    }
}
