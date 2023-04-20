//
//  SwiftUI_DemoApp.swift
//  SwiftUI-Demo
//
//  Created by DuocVo on 4/3/23.
//

import SwiftUI

@main
struct SwiftUI_DemoApp: App {
  private let game = EmojiMemoryGame()
  
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
