//
//  ContentView.swift
//  Memorize
//
//  Created by Chad Smith on 6/2/21.
//

import SwiftUI

struct ContentView: View {
    static let vehicleEmojis = ["🚘", "🚙", "🏍", "🛩", "🚐", "🏎", "🚞", "🚉", "🚢", "🚁"]
    static let technologyEmojis = ["📸", "📲", "📞", "☎️", "💻", "🎥", "📺", "💾", "🕹", "⌚️"]
    static let flagEmojis = ["🇺🇸", "🏳️‍🌈", "🇸🇦", "🇨🇳", "🏴‍☠️", "🇮🇶", "🏁", "🇻🇪", "🇻🇳", "🇹🇭", "🇬🇧", "🇰🇷"]
    
    @State var emojis = vehicleEmojis
    
    @State var emojiCount = 5
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
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
            HStack(alignment: .bottom) {
                Button(action: {self.setEmojiType(emojiType: "Vehicle")}) {
                    VStack {
                        Image(systemName: "car")
                        Text("Vehicle")
                            .font(.caption)
                    }
                }
                Spacer()
                Button(action: {self.setEmojiType(emojiType: "Technology")}) {
                    VStack {
                        Image(systemName: "tv")
                        Text("Technology")
                            .font(.caption)
                    }
                }
                Spacer()
                Button(action: {self.setEmojiType(emojiType: "Flags")}) {
                    VStack {
                        Image(systemName: "flag")
                        Text("Flags")
                            .font(.caption)
                    }
                }
            }
            .padding([.leading, .bottom, .trailing])
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    func setEmojiType(emojiType: String) {
        switch emojiType {
        case "Vehicle":
            emojis = ContentView.vehicleEmojis
        case "Technology":
            emojis = ContentView.technologyEmojis
        case "Flags":
            emojis = ContentView.flagEmojis
        default:
            emojis = ContentView.vehicleEmojis
        }
        
        emojis.shuffle()
        emojiCount = Int.random(in: 4..<emojis.count)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            ContentView().preferredColorScheme($0)
        }
    }
}
