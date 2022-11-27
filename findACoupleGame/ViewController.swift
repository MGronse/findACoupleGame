//
//  ViewController.swift
//  findACoupleGame
//
//  Created by Марс Мазитов on 27.11.2022.
//

import UIKit

class ViewController: UIViewController {

    var touches = 0 {
        didSet {
            touchesCounterLabel.text = "Touches: \(touches)"
        }
    }
    let emojiCollection =  ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐮"]
    @IBOutlet var buttonsCollection: [UIButton]!
    @IBOutlet weak var touchesCounterLabel: UILabel!
    

    @IBAction func cardButtonPressed(_ sender: UIButton) {
        touches += 1
        guard let buttonIndex = buttonsCollection.firstIndex(of: sender) else { return }
        flipBitton(emoji: emojiCollection[buttonIndex], button: sender)
    }
    
    func flipBitton (emoji: String, button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .systemGray4
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = nil
        }
        
    }
}
