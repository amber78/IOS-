//
//  ViewController.swift
//  seven
//
//  Created by 509 on 2018/11/10.
//  Copyright © 2018年 2016110308. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cardButons: [UIButton]!
    @IBOutlet weak var Score: UILabel!
    
    lazy var game = Concentation(numberOfPairsOfCards: (cardButons.count + 1) / 2)
 
    
    
    var flipCount = 0 {
        didSet{
            Score.text = "Score: \(game.score)"
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        if let cardNumber = cardButons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else{
            print("chosen card was not in cardButonds")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButons.indices{
            let button = cardButons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for:card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            }
            else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 0) : #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
            }
        }
        Score.text = "Score: \(game.score)"
    }
    
    var emojiChoices = ["👻","🐶","👻","🐶","🐻","🐸","🐻","🐸","😆","🐵","🐣","🐵","🐣"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil,emojiChoices.count > 0{
                let randomInedx = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomInedx)
        }
        return emoji[card.identifier] ?? "?"
    }

    @IBAction func new(_ sender: Any) {
        game = Concentation(numberOfPairsOfCards: (cardButons.count + 1) / 2)
        emojiChoices = ["👻","🐶","👻","🐶","🐻","🐸","🐻","🐸","😆","🐵","🐣","🐵","🐣"]
        updateViewFromModel()
        
    }
}

