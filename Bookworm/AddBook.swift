//
//  AddBook.swift
//  Bookworm
//
//  Created by Shomil Singh on 18/03/24.
//

import SwiftUI
import SwiftData

struct AddBook: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var review = ""
    @State private var genre = "Fantasy"
    @State private var rating = 3
    let genres = ["Fantasy" , "Horror" , "Kid" , "Mystery" , "Poetry" , "Romance" , "Thriller"]
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Author's name" , text: $author)
                    Picker("Genre", selection: $genre){
                        ForEach(genres , id: \.self){
                            Text($0)
                        }
                    }
                }
                Section("Write a review"){
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                }
                Button("Save"){
                    let newBook = Book(name: title, author: author, genres: genre, review: review, rating: rating)
                    modelContext.insert(newBook)
                    dismiss()
                    
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBook()
}
