//
//  ThemesListView.swift
//  Memorize
//
//  Created by Chad Smith on 6/28/21.
//

import SwiftUI

struct ThemesListView: View {
    @EnvironmentObject var store: ThemeStore
    @State private var themeToEdit: Theme<String>?
    @State private var editMode: EditMode = .inactive
    
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
                    .gesture(editMode.isEditing ? tapToEditGesture(theme: theme) : nil)
                }
                .onDelete(perform: { indexSet in
                    store.themes.remove(atOffsets: indexSet)
                })
            }
            .sheet(item: $themeToEdit) { theme in
                ThemeEditor(theme: $store.themes[theme])
            }
            .navigationTitle("Memorize")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        store.insertTheme()
                        themeToEdit = store.getTheme(at: store.themes.count - 1)
                    }, label: {
                        Image(systemName: "plus")
                    })
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .environment(\.editMode, $editMode)
        }
    }
    
    private func addTheme() {
        store.insertTheme()
    }
    
    private func tapToEditGesture(theme: Theme<String>) -> some Gesture {
        TapGesture()
            .onEnded {
                themeToEdit = store.themes[theme]
            }
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
