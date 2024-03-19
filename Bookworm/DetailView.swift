//
//  DetailView.swift
//  Bookworm
//
//  Created by Shomil Singh on 19/03/24.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    let book : Book
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomTrailing){
                Image(book.genres)
                    .resizable()
                    .scaledToFit()
                Text("\(book.genres.uppercased())")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(Color.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5 , y: -5)
                    
            }
            Text("\(book.author)")
                .foregroundStyle(.secondary)
                .font(.title)
//                .padding()
            Text("\(book.review)")
                .font(.title2)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
            
            
        }
        .navigationTitle("\(book.name)")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    do{
        let container = try ModelContainer(for: Book.self, configurations: config)
       return DetailView(book: Book(name: "Test book", author: "Book author", genres: "Fantasy", review: "This is the review of book even idont know ", rating: 4))
            .modelContainer(container)
    }
    catch{
       return Text(("error in preview \(error.localizedDescription)"))
    }
    
}
