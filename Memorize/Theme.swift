//
//  Theme.swift
//  Memorize
//
//  Created by Chad Smith on 6/5/21.
//

import Foundation

struct Theme<Content> {
    var name: String
    var emojiContent: [Content]
    var color: String
    var numberOfPairs: Int
    
    init(name: String, emojiContent: [Content], color: String, numberOfPairs: Int) {
        self.init(name: name, emojiContent: emojiContent, color: color)
        self.numberOfPairs = numberOfPairs
        
        if numberOfPairs > emojiContent.count {
            self.numberOfPairs = emojiContent.count
        }
    }
    init(name: String, emojiContent: [Content], color: String) {
        self.name = name
        self.emojiContent = emojiContent
        self.color = color
        self.numberOfPairs = emojiContent.count
    }
}
