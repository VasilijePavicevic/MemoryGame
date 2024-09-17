//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Vasilije Pavicevic on 11.9.24..
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
