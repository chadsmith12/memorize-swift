//
//  MemoryGame.swift
//  Memorize
//
//  Created by Chad Smith on 6/3/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    private var seedCards: [Card]
    private(set) var score: Int
    
    private var currentIndexofFaceUp: Int? {
        get {
            cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly
        }
        set {
            cards.indices.forEach{cards[$0].isFaceUp = ($0 == newValue)}
        }
    }
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        // add the numberOfPairOfCards * 2
        for pairIndex in 0..<numberOfPairOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        
        cards = cards.shuffled()
        seedCards = []
        score = 0
    }
    
    mutating func choose(_ card: Card) {
        // we attempt to find this card, and the card can't be already face up or matched
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            // we currently have another card that is face up
            if let potentialMatchIndex = currentIndexofFaceUp {
                // the card we chose is the same as the card already flipped over
                // we need to set these as matched
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                }
                cards[chosenIndex].isFaceUp = true
            }
            // we don't have another card face up
            else {
                currentIndexofFaceUp = chosenIndex
            }
        }
    }
    
    func hasSeen(card: Card) -> Bool {
        seedCards.contains { currentCard in
            currentCard.id == card.id
        }
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        
        return nil
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}
