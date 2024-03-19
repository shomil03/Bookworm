//
//  ContentView.swift
//  Bookworm
//
//  Created by Shomil Singh on 17/03/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var isShowingSheet = false
    @Query var books : [Book]
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(books){book in
                        NavigationLink( value: book){
                            HStack{
                                EmojiRatingView(rating: book.rating)
                                    .font(.largeTitle)
                                VStack(alignment: .leading){
                                    Text(book.name)
                                        .font(.headline)
                                    Text(book.author)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                        
                    }
                                        
                }
                .navigationDestination(for: Book.self){book in
                    DetailView(book: book)
                }

                
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button("Add book" , systemImage: "plus"){
                        isShowingSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $isShowingSheet, content: {
                AddBook()
            })
            .navigationTitle("Bookworm")
                
        }
        
    }
}

#Preview {
    ContentView()
}
