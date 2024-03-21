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
    @Query(sort:
            [SortDescriptor(\Book.rating),
             SortDescriptor(\Book.author)],
           animation: .bouncy) var books : [Book]
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
//                        .background(book.rating == 1 ? Color.red : Color.clear)
                        .foregroundStyle(book.rating == 1 ? Color.red : Color.primary)
                        
                    }.onDelete(perform: deleteBook)
                    
                                        
                }
                .navigationDestination(for: Book.self){book in
                    DetailView(book: book)
                }

                
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
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
    func deleteBook(at offsets : IndexSet){
        for offset in offsets{
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
