//
//  ContentView.swift
//  WordScramble
//
//  Created by Alisha Carrington on 09/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    // words submitted in textfield
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")  // SF symbol number circle
                            Text(word)
                        }
                    }
                }
                
                // score
                Section {
                    HStack {
                        Text("Total Words:")
                        Spacer()
                        Text("\(usedWords.count)")
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("New Game") {
                        startGame()
                    }
                }
            }
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func addNewWord() {
        // lowercase and trim the word
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit function if the string is empty
        guard answer.count > 0 else { return }
        
        // extra validation
        guard isOriginal(word: answer) else {
            // trigger alert
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognised", message: "You can't just make them up, you know!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isTooShort(word: answer) else {
            wordError(title: "Word too short", message: "Try words longer than 3 letters")
            return
        }
        
        guard isStartWord(word: answer) else {
            wordError(title: "Word not allowed", message: "That's the same as the start word!")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)  // add entered word to start of list
        }
        newWord = ""  // reset textfield after entry
    }
    
    func startGame() {
        // reset list and textfield
        newWord = ""
        usedWords.removeAll()
        
        // find url for start.txt in bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL, encoding: .ascii) {
                // split the string into an array of strings - separating on line breaks
                let allWords = startWords.components(separatedBy: "\n")
                
                // choose random word from array or use default
                rootWord = allWords.randomElement() ?? "silkworm"
                
                // exit function
                return
            }
        }
        
        // runs if there is a problem - triggers crash
        fatalError("Could not load start.txt from bundle.")
    }
    
    // check if user input has been used before - if in existing array
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    // check if user input can be made out of the letters from the root word
    func isPossible(word: String) -> Bool {
        // make copy of rootWord
        var tempWord = rootWord
        
        for letter in word {
            // loop through each letter of user's input - check if exists in the rootWord copy
            if let pos = tempWord.firstIndex(of: letter) {
                // if it does exist, remove it from the rootWord copy - letter can't be used twice
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    // check if user input is a real word
    func isReal(word: String) -> Bool {
        // new instance of UITextChecker
        let checker = UITextChecker()
        // NSRange to scan entire length of string
        let range = NSRange(location: 0, length: word.utf16.count)
        // call rangeOfMisspelledWord() to check for wrong words - returns NSRange saying where the misspelled word is found (location)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        // if word is okay, the location will be NSNotFound
        return misspelledRange.location == NSNotFound
    }
    
    // check if user input is longer than 3 letters
    func isTooShort(word: String) -> Bool {
        if word.count < 3 {
            return false
        }
        return true
    }
    
    // check if user input is same as rootWord
    func isStartWord(word: String) -> Bool {
        word != rootWord
    }
    
    // for error alert
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
        newWord = ""  // reset textfield
    }
}

#Preview {
    ContentView()
}
