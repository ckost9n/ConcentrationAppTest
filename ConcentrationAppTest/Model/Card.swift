//
//  Card.swift
//  ConcentrationAppTest
//
//  Created by Konstantin on 02.06.2021.
//

import Foundation

struct Card {
    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(identifier)
//    }
//
//    static func ==(lhs: Card, rhs: Card) -> Bool {
//        return lhs.identifier == rhs.identifier
//    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierNumber = 0
    
    private static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
    
}

extension Card: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
