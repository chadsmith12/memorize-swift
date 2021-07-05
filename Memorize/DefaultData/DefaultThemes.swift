//
//  DefaultThemes.swift
//  Memorize
//
//  Created by Chad Smith on 6/28/21.
//

import Foundation
import SwiftUI

struct DefaultThemes {
    private static let vehicleEmojis = ["🚘", "🚙", "🏍", "🛩", "🚐", "🏎", "🚞", "🚉", "🚢", "🚁"]
    private static let flagEmojis = ["🇺🇸", "🏳️‍🌈", "🇸🇦", "🇨🇳", "🏴‍☠️", "🇮🇶", "🏁", "🇻🇪", "🇻🇳",  "🇹🇭", "🇬🇧", "🇫🇲", "🇨🇴", "🇹🇷", "🇺🇦", "🇧🇼"]
    
    static func createThemes() -> [Theme<String>] {
        [
            Theme<String>(name: "Vehicles", emojiContent: vehicleEmojis, color: RGBAColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)),
            Theme<String>(name: "Flags", emojiContent: flagEmojis, color: RGBAColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), numberOfPairs: 6)
        ]
    }
}
