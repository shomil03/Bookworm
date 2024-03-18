//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Shomil Singh on 17/03/24.
//
import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
