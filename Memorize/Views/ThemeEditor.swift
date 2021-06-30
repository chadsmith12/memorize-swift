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
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Name", text: $theme.name)
                }
            }
            .toolbar {
                Button("Done") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct ThemeEditor_Previews: PreviewProvider {
    static var previews: some View {
        ThemeEditor(theme: .constant(ThemeStore(name: "PreviewStore").getTheme(at: 0)))
    }
}
