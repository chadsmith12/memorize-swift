//
//  DefaultThemes.swift
//  Memorize
//
//  Created by Chad Smith on 6/28/21.
//

import Foundation

struct DefaultThemes {
    private static let vehicleEmojis = ["🚘", "🚙", "🏍", "🛩", "🚐", "🏎", "🚞", "🚉", "🚢", "🚁"]
    private static let flagEmojis = ["🇺🇸", "🏳️‍🌈", "🇸🇦", "🇨🇳", "🏴‍☠️", "🇮🇶", "🏁", "🇻🇪", "🇻🇳",  "🇹🇭", "🇬🇧", "🇫🇲", "🇨🇴", "🇹🇷", "🇺🇦", "🇧🇼"]
    
    static func createThemes() -> [Theme<String>] {
        [
            Theme<String>(name: "Vehicles", emojiContent: vehicleEmojis, color: "blue"),
            Theme<String>(name: "Flags", emojiContent: flagEmojis, color: "green", numberOfPairs: 6)
        ]
    }
}
