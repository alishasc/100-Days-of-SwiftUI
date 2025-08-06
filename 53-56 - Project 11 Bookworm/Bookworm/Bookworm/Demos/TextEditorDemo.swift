//
//  TextEditorDemo.swift
//  Bookworm
//
//  Created by Alisha Carrington on 03/08/2025.
//

import SwiftUI

struct TextEditorDemo: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
//            TextEditor(text: $notes)
//                .navigationTitle("Notes")
//                .padding()
            
            // normal textfield that will automatically expand as you type
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
            Spacer()
        }
    }
}

#Preview {
    TextEditorDemo()
}
