//
//  Concentation.swift
//  seven
//
//  Created by 509 on 2018/11/11.
//  Copyright © 2018年 2016110308. All rights reserved.
//

import Foundation
class Concentation{
    var score = 0
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndx = indexOfOneAndOnlyFaceUpCard,matchIndx != index {
                if cards[matchIndx].identifier == cards[index].identifier {
                    cards[matchIndx].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                }else{
                    if cards[matchIndx].isSeen {
                        score -= 1
                    }
                    if cards[index].isSeen {
                        score -= 1
                    }
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else{
                for flipDownTndex in cards.indices {
                    cards[flipDownTndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
    }
}
