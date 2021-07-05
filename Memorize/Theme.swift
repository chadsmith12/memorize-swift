//
//  Theme.swift
//  Memorize
//
//  Created by Chad Smith on 6/5/21.
//

import Foundation

struct Theme<Content>: Codable, Identifiable, Hashable where Content: Codable, Content: Hashable {
    var name: String
    var emojiContent: [Content]
    var color: RGBAColor
    var numberOfPairs: Int
    var id: UUID
    
    init(name: String, emojiContent: [Content], color: RGBAColor, numberOfPairs: Int) {
        self.init(name: name, emojiContent: emojiContent, color: color)
        self.numberOfPairs = numberOfPairs
        
        if numberOfPairs > emojiContent.count {
            self.numberOfPairs = emojiContent.count
        }
    }
    init(name: String, emojiContent: [Content], color: RGBAColor) {
        self.name = name
        self.emojiContent = emojiContent
        self.color = color
        self.numberOfPairs = emojiContent.count
        self.id = UUID()
    }
}
