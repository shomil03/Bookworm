//
//  AddBook.swift
//  Bookworm
//
//  Created by Shomil Singh on 18/03/24.
//

import SwiftUI
import SwiftData
import Foundation

struct AddBook: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var review = ""
    @State private var genre = "Fantasy"
    @State private var rating = 3
    @State private var isShowingAlert = false
    

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
                    let dateFormatter =  DateFormatter()
                    dateFormatter.dateFormat = "dd-mm-yyyy"
                    
                    if(Validation()){
                        isShowingAlert = true
                        return
                    }
                    else{
                        let newBook = Book(name: title, author: author, genres: genre, review: review, rating: rating, date: dateFormatter.string(from: Date.now))
                        modelContext.insert(newBook)
                        dismiss()
                    }
                    
                }
            }
            .navigationTitle("Add Book")
            .alert("Invalid form",
                   isPresented: $isShowingAlert,
                   actions: {}, 
                   message:{ Text("Please fill all fields")})
            
        }
    }
    func Validation() -> Bool{
        if(title.isEmpty || author.isEmpty || genre.isEmpty || review.isEmpty){
            return true
        }
            return false
        
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    do{
        let container = try ModelContainer(for: Book.self, configurations: config)
        return AddBook()
            .modelContainer(container)
           
    }catch{
        return Text("Error")
    }
    
}
