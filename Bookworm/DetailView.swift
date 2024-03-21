//
//  DetailView.swift
//  Bookworm
//
//  Created by Shomil Singh on 19/03/24.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State private var showingalert = false
    let book : Book
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottom){
                Image(book.genres)
                    .resizable()
                    .scaledToFit()
                HStack{
                    Text("\(book.date)")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(.capsule)
                        .offset(x: 5 , y: -5)
                    Spacer()
                    Text("\(book.genres.uppercased())")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(Color.black.opacity(0.50))
                        .clipShape(.capsule)
                        .offset(x: -5 , y: -5)
                   
                   
//                        .offset(x : -5 , y : 5)
                }
                    
                    
            }
            Text("\(book.author)")
                .foregroundStyle(.secondary)
                .font(.title)
                .padding()
            Text("\(book.review)")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
            
            
        }
        .navigationTitle("\(book.name)")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .toolbar{
            Button("Delete this book", systemImage: "trash"){
                showingalert = true
            }
             
        }
        .alert("Delete this book ? ", isPresented: $showingalert){
            Button("Cancel", role: .cancel, action: {})
            Button("Delete", role: .destructive, action: deleteBook)
        } message: {
            Text("Are you sure")
        }
    }
    func deleteBook(){
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    do{
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy"
        let container = try ModelContainer(for: Book.self, configurations: config)
        return DetailView(book: Book(name: "Test book", author: "Book author", genres: "Fantasy", review: "This is the review of book even idont know ", rating: 4 , date: dateFormatter.string(from: Date.now)))
            .modelContainer(container)
    }
    catch{
       return Text(("error in preview \(error.localizedDescription)"))
    }
    
}
