//
//  GameModel.swift
//  findACoupleGame
//
//  Created by Марс Мазитов on 27.11.2022.
//

import Foundation

class GameModel {
    var cards = [CardModel]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex].idintifier == cards[index].idintifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                
                cards.indices.forEach { cards[$0].isFaceUp = false }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init (numbersOfPairdOfCards: Int) {
        for _ in 1...numbersOfPairdOfCards {
            let card = CardModel()
            cards.append(contentsOf: repeatElement(card, count: 2))
        }
        cards.shuffle()
        print(cards)
    }
}
