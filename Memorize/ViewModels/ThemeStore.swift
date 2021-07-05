//
//  ThemeStore.swift
//  Memorize
//
//  Created by Chad Smith on 6/28/21.
//

import Foundation

class ThemeStore: ObservableObject {
    typealias EmojiTheme = Theme<String>
    let name: String
    
    @Published var themes = [EmojiTheme]()
    
    private var userDefaultsKey: String {
        "ThemeStore:\(name)"
    }
    
    init(name: String) {
        self.name = name
        restoreFromUserDefaults()
        if self.themes.count == 0 {
            self.themes = DefaultThemes.createThemes()
        }
    }
    
    func insertTheme(named name: String, content: String, color: String, numberPairs: Int = 2)  {
        themes.append(EmojiTheme(name: name, emojiContent: [content], color: RGBAColor(red: 0, green: 0, blue: 1, alpha: 1), numberOfPairs: numberPairs))
    }
    
    func getTheme(at index: Int) -> EmojiTheme {
        let safeIndex = min(max(index, 0), themes.count - 1)
        return themes[safeIndex]
    }
    
    private func storeInUserDefaults() {
        let encodedData = try? JSONEncoder().encode(themes)
        UserDefaults.standard.set(encodedData, forKey: userDefaultsKey)
    }
    
    private func restoreFromUserDefaults() {
        if let jsonData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decodedThemes = try? JSONDecoder().decode([EmojiTheme].self, from: jsonData)  {
            themes = decodedThemes
        }
    }
}
