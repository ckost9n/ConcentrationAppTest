//
//  ViewController.swift
//  ConcentrationAppTest
//
//  Created by Konstantin on 01.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let emojiCollection = ["🦊", "🐱", "🦊", "🐱"]
    
    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    @IBOutlet weak var touchLabel: UILabel!
    @IBOutlet var buttonCollection: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            flipButton(emoji: emojiCollection[buttonIndex], button: sender)            
        }
    }
    
    private func flipButton(emoji: String, button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.1370180547, green: 0.4909098148, blue: 0.8612185121, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }


}

