//
//  CardModel.swift
//  findACoupleGame
//
//  Created by Марс Мазитов on 27.11.2022.
//

import Foundation

struct CardModel {
    var isFaceUp = false
    var isMatched = false
    var idintifier: Int
    
    static var identifierNumber = 0
    
    static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    init() {
        self.idintifier = CardModel.identifierGenerator()
    }
}

