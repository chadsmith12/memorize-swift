//
//  ThemeEditor.swift
//  Memorize
//
//  Created by Chad Smith on 6/29/21.
//

import SwiftUI

struct ThemeEditor: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var theme: Theme<String>
    @State private var newEmojis: String = ""
    @State private var themeColor = Color.red
    
    private var distinctEmojis: [String] {
        return theme.emojiContent
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name").font(.headline)) {
                    TextField("Name", text: $theme.name)
                }
                Section(header: Text("Add Emojis").font(.headline)) {
                    HStack {
                        TextField("Emoji", text: $newEmojis)
                        Button("Add") {
                            addEmojis(self.newEmojis)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                Section(header: HStack {
                    Text("Emojis").font(.headline)
                    Spacer()
                    Text("Tap emoji to exclude")
                }) {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                        ForEach(distinctEmojis, id: \.self) { emoji in
                            Text(emoji)
                                .padding([.vertical], 2)
                                .onTapGesture {
                                    removeEmoji(emoji)
                                }
                        }
                    }
                }
                Section(header: Text("Card Count").font(.headline)) {
                    Stepper("\(theme.numberOfPairs) Paris", value: $theme.numberOfPairs, in: min(theme.emojiContent.count, 2)...theme.emojiContent.count)
                        .disabled(theme.emojiContent.count < 2)
                }
                Section(header: Text("Color").font(.headline)) {
                    ColorPicker("Theme Color", selection: $themeColor)
                        .onChange(of: themeColor, perform: { value in
                            theme.color = RGBAColor(color: themeColor)
                    })
                }
            }
            .toolbar {
                Button("Done") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle(Text(theme.name))
        }
        .onAppear {
            self.themeColor = Color(rgbaColor: self.theme.color)
        }
    }
    
    private func addEmojis(_ emojis: String) {
        withAnimation {
            let trimmedCharacters = emojis.trimmingCharacters(in: .whitespacesAndNewlines)
            let emojiSet = Set(trimmedCharacters.map{String($0)})
            self.theme.emojiContent.insert(contentsOf: emojiSet, at: 0)
            self.newEmojis = ""
        }
    }
    
    private func removeEmoji(_ emoji: String) {
        print("removing the \(emoji) emoji")
        withAnimation {
            theme.emojiContent.removeAll(where: {String($0) == emoji})
            theme.numberOfPairs = min(theme.emojiContent.count, theme.numberOfPairs)
        }
    }
}

struct ThemeEditor_Previews: PreviewProvider {
    static var previews: some View {
        ThemeEditor(theme: .constant(ThemeStore(name: "PreviewStore").getTheme(at: 0)))
    }
}
