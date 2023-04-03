//
//  ContentView.swift
//  SwiftUI-Demo
//
//  Created by DuocVo on 4/3/23.
//

import SwiftUI

struct ContentView: View {
  var emojis: [String] = ["✈️", "🚃", "🛩", "🚗", "✈️", "🚃", "🛩", "🚗", "✈️", "🚃", "🛩", "🚗"]
  
  @State var emojiCount: Int = 4
  
  var body: some View {
    VStack {
      HStack {
        ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
          CardView(content: emoji)
        }
      }
      
      HStack {
        RemoveButton(emojiCount: $emojiCount)
        Spacer()
        AddButton(emojiCount: $emojiCount)
      }
      .padding(.horizontal)
      
      
    }
    .padding(.horizontal)
    .foregroundColor(.red)
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

struct CardView: View {
  @State var isFaceUp: Bool = false
  var content: String
  
  var body: some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: 20)
      if isFaceUp {
        shape
          .fill().foregroundColor(.white)
        shape
          .stroke(lineWidth: 3)
        
        
        Text(content).font(.largeTitle)
      } else {
        shape
          .fill()
      }
    }
    .onTapGesture{
      isFaceUp.toggle()
    }
  }
  
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
