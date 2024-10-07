//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Vasilije Pavicevic on 14.9.24..
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    @AppStorage("isOn") private var isOn: Bool = false
    @Published private var model: MemoryGame<String>
    private var currentTheme: [String] = emojis
    private static let emojis = ["🎾","🎿","🎱","🏑","🏀","🤸‍♂️","🤽‍♂️","🏄‍♂️","🥋","🏓","🏈","🏋️‍♀️"]
    private static let emojiVehicles = ["🚙","🚌","🛴","🚲","🚃","🚛","🛵","🚜","🚕","🚎","🏍️","🏎️"]
    private static let emojisAnimals = ["🐶","🐱","🐭","🐹","🐰","🐮","🐷","🐧","🐦","🐤","🦆","🐦‍⬛"]
    private static let emojisNature = ["🌵","🌲","🌳","🌴","🌸","🌱","🌿","🍂","🌼","🍃","🌻","🍁"]
    
    init() {
        
            self.model = EmojiMemoryGame.createMemoryGame(with: EmojiMemoryGame.emojis)
        }
    
    private static func createMemoryGame(with theme: [String]) -> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: min(theme.count, 10)){ pairIndex in
            if emojis.indices.contains(pairIndex) {
                return theme[pairIndex]
            } else {
                return "?"
            }
        }
    }
    
    
    
   // @Published private var model = createMemoryGame(with: emojis)
    
    var cards: Array<Card>{
        return model.cards
    }
    
    var color: Color {
        if isOn {
            .yellow
        }
        else {
            .black
        }
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
    func setTheme(_ theme: String) {
           switch theme {
           case "vehicles":
               currentTheme = EmojiMemoryGame.emojiVehicles
           case "animals":
               currentTheme = EmojiMemoryGame.emojisAnimals
           case "nature":
               currentTheme = EmojiMemoryGame.emojisNature
           default:
               currentTheme = EmojiMemoryGame.emojis // default
           }
           model = EmojiMemoryGame.createMemoryGame(with: currentTheme)
       }
}

