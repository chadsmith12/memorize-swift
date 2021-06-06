//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Chad Smith on 6/2/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
