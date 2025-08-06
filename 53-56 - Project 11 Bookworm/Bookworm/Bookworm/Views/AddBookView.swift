//
//  AddBookView.swift
//  Bookworm
//
//  Created by Alisha Carrington on 04/08/2025.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    // genres for the Picker
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var isValidForm: Bool {
        // form is incomplete - disable save button
        if title.isEmpty || author.isEmpty || review.isEmpty {
            return true
        }
        
        return false
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        // save the new book
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        
                        dismiss()
                    }
                }
                .disabled(isValidForm)
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
