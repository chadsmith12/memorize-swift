//
//  ContentView.swift
//  Memorize
//
//  Created by Chad Smith on 6/2/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text(viewModel.themeName)
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.themeColor)
            HStack {
                Button("New Game") {
                    viewModel.createNewGame()
                }
                Spacer()
                Text("Score: \(viewModel.currentScore)")
            }
            
        }
        .padding(.horizontal)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            ContentView(viewModel: EmojiMemoryGame()).preferredColorScheme($0)
        }
    }
}
