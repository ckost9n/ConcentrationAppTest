//
//  ConcentrationGame.swift
//  ConcentrationAppTest
//
//  Created by Konstantin on 02.06.2021.
//

import Foundation

struct ConcentrationGame {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex] == cards[index] {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCard: Int) {
        assert(numberOfPairsOfCard > 0,"ConcentrationGame.init(\(numberOfPairsOfCard): must have at least one pair of pards.")
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            cards += [card, card]       // Два раза вызвать метод cards.append[card]
            cards.shuffle()
        }
        
    }
    
}

extension Collection {
    
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
