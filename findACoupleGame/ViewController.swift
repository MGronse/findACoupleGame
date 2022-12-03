//
//  ViewController.swift
//  findACoupleGame
//
//  Created by Марс Мазитов on 27.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = GameModel(numbersOfPairdOfCards: (buttonsCollection.count + 1) / 2 )
    var touches = 0 {
        didSet {
            touchesCounterLabel.text = "Touches: \(touches)"
        }
    }
    @IBOutlet var buttonsCollection: [UIButton]!
    @IBOutlet weak var touchesCounterLabel: UILabel!
    
    var emojiCollection =  ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐮"]
    var emojiDictionary = [Int: String]()
    
    func emojiIdetifier(for card: CardModel) -> String {
        if emojiDictionary[card.idintifier] == nil {
            emojiDictionary[card.idintifier] = emojiCollection.randomElement()
            emojiCollection.remove(at: emojiCollection.firstIndex(of: emojiDictionary[card.idintifier]!)!)

        }
        return emojiDictionary[card.idintifier] ?? "?"
    }
    
    func updateViewFromModel() {
        for index in buttonsCollection.indices {
            let button = buttonsCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdetifier(for: card), for: .normal)
                button.backgroundColor = nil
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .none : .systemGray4
                
            }
        }
    }
    
    @IBAction func cardButtonPressed(_ sender: UIButton) {
        touches += 1
        guard let buttonIndex = buttonsCollection.firstIndex(of: sender) else { return }
        game.chooseCard(at: buttonIndex)
        updateViewFromModel()
    }
    
    
}
