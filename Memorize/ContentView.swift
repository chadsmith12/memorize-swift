//
//  ContentView.swift
//  Memorize
//
//  Created by Chad Smith on 6/2/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚘", "🚙", "🏍", "🛩", "🚐", "🏎"]
    @State var emojiCount = 5
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji, isFaceUp: false)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                Button(action: removeEmoji) {
                    Image(systemName: "minus.circle")
                }
                Spacer()
                Button(action: addEmoji){
                    Image(systemName: "plus.circle")
                }
            }
            .padding([.leading, .bottom, .trailing])
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    func removeEmoji() {
        if emojiCount > 1 {
            self.emojiCount -= 1
        }
    }
    
    func addEmoji() {
        if emojiCount < emojis.count {
            self.emojiCount += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            ContentView().preferredColorScheme($0)
        }
    }
}
