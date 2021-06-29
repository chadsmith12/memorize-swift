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
    @StateObject var themeStore = ThemeStore(name: "Default")
    
    var body: some Scene {      
        WindowGroup {
            ThemesListView()
                .environmentObject(themeStore)
        }
    }
}
