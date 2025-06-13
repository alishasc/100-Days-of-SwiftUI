//
//  day29.swift
//  WordScramble
//
//  Created by Alisha Carrington on 09/06/2025.
//

import SwiftUI

struct day29: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]

    var body: some View {
        List {
            Section("Section 1") {
                Text("Static row")
                Text("Static row")
            }
            
            Section("Section 2") {
                ForEach(0..<5) { _ in
                    Text("Dynamic row")
                }
            }
            
            Section("Section 3") {
                Text("Static row")
                Text("Static row")
            }
        }
        .listStyle(.grouped)
        
        List(people, id: \.self) {
            Text($0)
        }
        
        // check for spelling mistake
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word,
                                                            range: range,
                                                            startingAt: 0,
                                                            wrap: false,
                                                            language: "en")
        let allGood = misspelledRange.location == NSNotFound
        Text("\(allGood)")
    }
}

#Preview {
    day29()
}
