//
//  ConcentrationGame.swift
//  ConcentrationAppTest
//
//  Created by Konstantin on 02.06.2021.
//

import Foundation

class ConcentrationGame {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    
//    func chooseCard(at index: Int) {
//        if !cards[index].isMatched {
//            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
//                if cards[matchingIndex].identifier == cards[index].identifier {
//                    cards[matchingIndex].isMatched = true
//                    cards[index].isMatched = true
//                }
//                cards[index].isFaceUp = true
//                indexOfOneAndOnlyFaceUpCard = nil
//            } else {
//                for flipDown in cards.indices {
//                    cards[flipDown].isFaceUp = false
//                }
//                cards[index].isFaceUp = true
//                indexOfOneAndOnlyFaceUpCard = index
//            }
//        }
//    }
    
    init(numberOfPairsOfCard: Int) {
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            cards += [card, card]       // Два раза вызвать метод cards.append[card]
            cards.shuffle()
        }
        
    }
    
}
