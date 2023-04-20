//
//  EmojiMemoryGameView.swift
//  SwiftUI-Demo
//
//  Created by DuocVo on 4/3/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  
  @ObservedObject var game: EmojiMemoryGame
  
  func tappedItem(_ card: EmojiMemoryGame.Card) {
    game.choose(card)
  }
  
  var body: some View {
    VStack {
      ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
          ForEach(game.cards) { card in
            CardView(card: card)
              .aspectRatio(2/3, contentMode: .fit)
              .onTapGesture {
                tappedItem(card)
              }
          }
        }
      }
      .foregroundColor(.red)
      
      Spacer()
      
//      HStack {
//        RemoveButton(emojiCount: $emojiCount)
//        Spacer()
//        AddButton(emojiCount: $emojiCount)
//      }
//      .padding(.horizontal)
      
      
    }
    .padding(.horizontal)
  }
}



struct CardView: View {
  let card: EmojiMemoryGame.Card
  
  var body: some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: 20)
      if card.isFaceUp {
        shape
          .fill().foregroundColor(.white)
        shape
          .strokeBorder(lineWidth: 3)
        
        Text(card.content).font(.largeTitle)
      } else if card.isMatched {
        shape.opacity(0)
      } else {
        shape
          .fill()
        Text(" ").font(.largeTitle)
      }
    }
  }
  
}

struct AddButton: View {
  @Binding var emojiCount: Int
  var body: some View {
    Button(action: {
      emojiCount += 1
    }, label: {
      Image(systemName: "plus.circle")
    })
  }
}

struct RemoveButton: View {
  @Binding var emojiCount: Int
  var body: some View {
    Button(action: {
      if(emojiCount > 1){
        emojiCount -= 1
      }
    }, label: {
      Image(systemName: "minus.circle")
    })
  }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
  static var previews: some View {
    let game = EmojiMemoryGame()
    EmojiMemoryGameView(game: game)
  }
}
