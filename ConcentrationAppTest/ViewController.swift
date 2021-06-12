//
//  ViewController.swift
//  ConcentrationAppTest
//
//  Created by Konstantin on 01.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = ConcentrationGame(numberOfPairsOfCard: numberOfPairsOfCard)
    
    var numberOfPairsOfCard: Int {
        return (buttonCollection.count + 1) / 2
    }
    
//    private var emojiCollection = ["🦊", "🐱", "🐺", "🐗", "🐋", "🦈", "🐙", "🦑", "🦍", "🦏", "🐄", "🐕"]
    private var emojiCollection = "🦊🐱🐺🐗🐋🦈🐙🦑🦍🦏🐄🐕"
    
    private var emojiDictionary = [Card:String]()
    
    
    private(set) var touches = 0 {
        didSet {
            updateTouches()
        }
    }
    
    @IBOutlet private weak var touchLabel: UILabel! {
        didSet {
            updateTouches()
        }
    }
    @IBOutlet private var buttonCollection: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
    
    private func updateTouches() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: UIColor.red
        ]
        let attributedString = NSAttributedString(string: "Touches: \(touches)", attributes: attributes)
        touchLabel.attributedText = attributedString
    }
    
    private func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card] == nil {
            let randomIndex = Int.random(in: 0...emojiCollection.count - 1)
            let randomStringIndex = emojiCollection.index(emojiCollection.startIndex, offsetBy: randomIndex)
            emojiDictionary[card] = String(emojiCollection.remove(at: randomStringIndex))
        }
        return emojiDictionary[card] ?? "?"
    }
    
    private func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : .blue
            }
        }
    }
    
//    private func flipButton(emoji: String, button: UIButton) {
//        if button.currentTitle == emoji {
//            button.setTitle("", for: .normal)
//            button.backgroundColor = #colorLiteral(red: 0.1370180547, green: 0.4909098148, blue: 0.8612185121, alpha: 1)
//        } else {
//            button.setTitle(emoji, for: .normal)
//            button.backgroundColor = .white
//        }
//    }


}

