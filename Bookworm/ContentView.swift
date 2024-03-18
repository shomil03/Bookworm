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
                Text("Books : \(books.count)")
                ForEach(books){book in
                    Text(book.name)
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
