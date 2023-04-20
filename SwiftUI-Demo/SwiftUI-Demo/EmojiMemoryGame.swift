//
//  EmojiMemoryGame.swift
//  SwiftUI-Demo
//
//  Created by DuocVo on 4/4/23.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
  
  private static let emojis: [String] = ["✈️", "🚃", "🛩", "🚗", "🤬", "❤️", "♣️", "♦️", "🤢", "♠️", "😃", "👹"]
  
  private static func makeCardContent(index: Int) -> String {
    return emojis[index]
  }
  
  typealias Card = MemoryGame<String>.Card
  
  static func createMemoryGame() -> MemoryGame<String> {
    MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: makeCardContent)
  }
  
  @Published private var model = createMemoryGame()
  
  var cards: Array<Card> {
    return model.cards
  }
  
  func choose(_ card: Card) {
    model.choose(card)
  }
}
