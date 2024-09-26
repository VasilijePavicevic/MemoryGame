//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Vasilije Pavicevic on 14.9.24..
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card


    private static let emojis = ["👻","🫀","⛑️","🌮","🏀","🚌","🏡","💣","🪓","📍","🃏","🆗"]
    
    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: 10){ pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "?"
            }
        }
    }
    
    
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card>{
        return model.cards
    }
    
    var color: Color {
        .green
    }
    
    var score: Int {
        model.score
    }
    
    func shuffle(){
        model.shuffle()
    }
    
    
    func choose(_ card: Card){
        model.choose( card)
    }
}

