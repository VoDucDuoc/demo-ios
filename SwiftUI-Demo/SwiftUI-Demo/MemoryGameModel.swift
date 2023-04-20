//
//  MemoryGameModel.swift
//  SwiftUI-Demo
//
//  Created by DuocVo on 4/4/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
  private(set) var cards: Array<Card>
  private var indexOfFaceUpCard: Int?
  
  struct Card: Identifiable {
    var isFaceUp = false
    var isMatched = false
    let content: CardContent
    let id: UUID = UUID()
  }
  
  init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
    cards = []
    for pairIndex in 0..<numberOfPairsOfCards {
      let content = createCardContent(pairIndex)
      cards.append(Card(content: content))
      cards.append(Card(content: content))
    }
  }
  
  mutating func choose(_ card: Card) {
    if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
      if indexOfFaceUpCard != nil {
        if cards[chosenIndex].content == cards[indexOfFaceUpCard!].content {
          cards[chosenIndex].isMatched = true
          cards[indexOfFaceUpCard!].isMatched = true
        }
        indexOfFaceUpCard = nil
      } else {
        for index in cards.indices {
          cards[index].isFaceUp = false
        }
        indexOfFaceUpCard = chosenIndex
      }
      cards[chosenIndex].isFaceUp.toggle()
    }
  }
  
  //  func indexOf(_ card: Card) -> Int? {
  //    for index in 0..<cards.count {
  //      if(cards[index].id == card.id) {
  //        return index
  //      }
  //    }
  //    return nil
  //  }
}
