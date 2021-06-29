//
//  ThemesListView.swift
//  Memorize
//
//  Created by Chad Smith on 6/28/21.
//

import SwiftUI

struct ThemesListView: View {
    @EnvironmentObject var store: ThemeStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.themes) { theme in
                    VStack(alignment: .leading) {
                        Text(theme.name)
                            .font(.title2)
                        HStack {
                            ForEach(theme.emojiContent, id: \.self) { emoji in
                                Text(emoji)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Memorize")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: addTheme, label: {
                        Image(systemName: "plus")
                    })
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    private func addTheme() {
        store.insertTheme(named: "New", content: "", color: "red")
    }
}

struct ThemesListView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesListView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12 Pro")
            .environmentObject(ThemeStore(name: "ThemeStorePreview"))
    }
}
